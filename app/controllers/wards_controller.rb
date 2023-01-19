class WardsController < ApplicationController
  def index
    return render json: { error: 'Please log in to access this page' }, status: :unauthorized unless logged_in?

    @wards = current_user.wards.all
    raise ActiveRecord::RecordNotFound unless @wards
    render json: @wards, status: :ok
  end

  def create
    if admin?
      @ward = current_user.wards.create(ward_params)
      if current_user.guardian_id != nil
        @guardian = User.find(current_user.guardian_id)
        @guardian.wards << @ward
      else
        current_user.guardians.each do |guardian|
          guardian.wards << @ward
        end
      end
      if @ward.save
        @ward.immunizations.create(w6: @ward.DOB + 6.weeks, w10: @ward.DOB + 10.weeks, w14: @ward.DOB + 14.weeks, m6: @ward.DOB + 6.months, m9: @ward.DOB + 9.months, m12: @ward.DOB + 12.months, m15: @ward.DOB + 15.months)
        render json: @ward, status: :created
      else
        render json: { error: 'Child could not be created. Please try again' }
      end
    else
      render json: { error: 'Not authorized to create child' }, status: :unauthorized
    end
  end

  def update
    if admin?
      @ward = current_user.wards.find(update_params[:id])
      if @ward.update(ward_params)
        render json: { message: 'Child updated', status: :updated }
      else
        render json: { message: 'Child could not be updated. Please try again' }
      end
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end


  def destroy
    if admin?
      @ward = current_user.wards.find(params[:id])
      if @ward.destroy
        render json: { message: 'Child deleted', status: :destroyed }, status: :ok
      else
        render json: { message: 'Child not deleted' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  private

  def ward_params
    params.permit(:first_name, :last_name, :DOB, :gender, :height, :weight)
  end

  def update_params
    params.permit(:id, :first_name, :last_name, :DOB, :gender, :height, :weight)
  end

end
