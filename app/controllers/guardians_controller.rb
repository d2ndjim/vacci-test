class GuardiansController < ApplicationController
  # before_action :load_guardian

  def create
    return unless admin?
    if User.find_by_email(guardian_params[:email])
      render json: { error: 'Email Exist , try a diffrent one' }, status: :not_acceptable
    else
      @guardian = current_user.guardians.create(guardian_params)
      @wards = current_user.wards.all
      @wards.each do |ward|
        @guardian.wards << ward
      end
      if @guardian.save
        token = issue_token(@guardian)
        render json: { user: UserSerializer.new(@guardian), jwt: token }
      elsif user.errors.messages
        render json: { error: user.errors.messages }
      else
        render json: { error: 'User could not be created. Please try again' }
      end
    end
  end


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

  def destroy
    if admin?
      @guardian = User.find_by(guardian_id: current_user.id, id: params[:guardian_id])
      if @guardian.destroy
        render json: { message: 'guardian deleted', status: :destroyed }, status: :ok
      else
        render json: { message: 'guardian not deleted' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not Allowed' }, status: :unauthorized
    end
  end


  private

  def guardian_params
    params.permit(:first_name, :last_name, :relationship, :email, :password)
  end
end
