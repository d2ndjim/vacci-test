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
    params.permit(:id, :w6, :w10, :w14, :m6, :m9, :m12, :m15)
  end
end
