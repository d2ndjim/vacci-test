class ImmunizationsController < ApplicationController
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
    params.permit(:vaccination_date)
  end
end
