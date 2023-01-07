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
      current_user.guardians.each do |guardian|
        guardian.wards << @ward
      end
      if @ward.save
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
      @ward = current_user.wards.find(params[:id])
      if @ward.update(child_params)
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
      render json: { error: 'Please log in' }, status: :unauthorized
    end
  end

  private

  def ward_params
    params.permit(:first_name, :last_name, :DOB, :gender, :height, :weight)
  end

end
