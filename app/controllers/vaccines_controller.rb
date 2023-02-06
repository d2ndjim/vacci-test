class VaccinesController < ApplicationController
  def index
    @ward = Ward.find(params[:ward_id])
    case params[:filter]
    when 'Due'
      @vaccines = @ward.vaccines.due
    when 'Upcoming'
      @vaccines = @ward.vaccines.upcoming
    when 'Completed'
      @vaccines = @ward.vaccines.completed
    when 'All'
      @vaccines = @ward.vaccines.all
    end
    @grouped_vaccines = @vaccines.group_by { |vaccine| vaccine.vaccination_date }
    grouped_vaccines_with_variable_dates = {}
    @grouped_vaccines.each do |vaccination_date, vaccines|
      date = vaccination_date.strftime("%Y-%m-%d")
      grouped_vaccines_with_variable_dates[date] = vaccines
    end
    render json: grouped_vaccines_with_variable_dates, status: :ok
  end

  def update
    @ward = Ward.find(params[:ward_id])
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
