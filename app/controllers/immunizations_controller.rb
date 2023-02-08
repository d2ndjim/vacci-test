class ImmunizationsController < ApplicationController
  def upcoming
    @wards = current_user.wards
    @immunizations = []
    @wards.each do |ward|
      ward.immunizations.where('vaccination_date >= ?', Date.today).order(:vaccination_date).each do |immunization|
        @immunizations << { immunization:, ward:, avatar_url: ward.avatar_url }
      end
    end
    render json: @immunizations, status: :ok
  end

  def reminder_days
    @ward = current_user.wards.first
    @immunizations = @ward.immunizations.first
    reminder = @immunizations.reminder_days
    render json: reminder, status: :ok
  end

  def update
    if logged_in?
      @wards = current_user.wards.pluck(:id)
      @immunizations = Immunization.where(ward_id: @wards)
      if @immunizations.update_all(reminder_days: immunization_params[:reminder_days])
        render json: { message: 'Reminder successfully set', status: :updated }
      else
        render json: { message: 'Reminder could not be set. Please try again' }
      end
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  private

  def immunization_params
    params.permit(:reminder_days)
  end
end
