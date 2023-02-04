class VaccinesController < ApplicationController
  def index
    @ward = current_user.wards.find(params[:ward_id])
    case params[:filter]
    when 'due'
      @vaccines = @ward.vaccines.due
    when 'upcoming'
      @vaccines = @ward.vaccines.upcoming
    when 'completed'
      @vaccines = @ward.vaccines.completed
    when 'all'
      @vaccines = @ward.vaccines.all
    end
    render json: @vaccines, status: :ok
  end

  def update
    @ward = current_user.wards.find(params[:ward_id])
    @vaccine = @ward.vaccines.find(params[:id])
    if @vaccine.update(vaccine_params)
      render json: { message: 'Vaccine updated' }, status: :ok
    else
      render json: { message: 'Vaccine not updated' }, status: :unprocessable_entity
    end
  end

  private

  def vaccine_params
    # params.require(:vaccine).permit(:id, :completed)
    params.permit(:completed)
  end
end
