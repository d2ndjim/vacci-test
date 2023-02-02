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

  def update
    if admin?
      @immunization = Immunization.find(params[:id])
      if @immunization.update(update_immunization_params)
        render json: { message: 'Immunization updated', status: :updated }
      else
        render json: { message: 'Immunization could not be updated. Please try again' }
      end
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  private

  def update_immunization_params
    params.permit(:completed)
  end
end
