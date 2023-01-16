class GuardiansController < ApplicationController
  # before_action :load_guardian

  def update
    if admin?
      @guardian.update(guardian_params)
      if @guardian.update(update_params)
        render json: { message: 'guardian updated', status: :updated }
      else
        render json: { message: 'Email already exists' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not Allowed' }, status: :unauthorized
    end
  end

  private

  def guardian_params
    params.permit(:first_name, :last_name, :relationship, :email, :phone, :location, :password)
  end
end
