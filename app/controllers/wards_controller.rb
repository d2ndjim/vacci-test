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
      if @ward.save
        Ward.immunization_schedules(@ward)
        Ward.vaccine_trackers(@ward)
        render json: { message: 'child created' }, status: :created
      else
        render json: { message: 'Child could not be created. Please try again' }
      end
    else
      render json: { message: 'Not authorized to create child' }, status: :unauthorized
    end
  end

  def user_child
    @ward = Ward.find(params[:id])
    render json: @ward, status: :ok
  end

  def update
    if admin?
      @ward = current_user.wards.find(update_params[:id])
      if @ward.update(update_params)
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
    params.require(:ward).permit(:first_name, :last_name, :date_of_birth, :gender, :height, :weight, :avatar)
    # params.permit(:first_name, :last_name, :date_of_birth, :gender, :height, :weight, :avatar)
  end

  def update_params
    params.require(:ward).permit(:id, :first_name, :last_name, :date_of_birth, :gender, :height, :weight, :avatar)
  end
end
