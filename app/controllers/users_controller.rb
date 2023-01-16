class UsersController < ApplicationController
  def create
    if User.find_by_email(user_params[:email])
      render json: { error: 'Email Exist , try a diffrent one' }, status: :not_acceptable
    else
      user = User.new(user_params)
      if user.save
        token = issue_token(user)
        render json: { user: UserSerializer.new(user), jwt: token }
      elsif user.errors.messages
        render json: { error: user.errors.messages }
      else
        render json: { error: 'User could not be created. Please try again' }
      end
    end
  end

  def user_guardians
    if admin?
      @guardians = current_user.guardians.all
      raise ActiveRecord::RecordNotFound unless @guardians
      render json: @guardians, status: :ok
    else
      render json: { error: 'Not Allowed' }, status: :unauthorized
    end
  end

  def add_guardian
    if admin?
      if User.find_by_email(user_params[:email])
        render json: { error: 'Email Exist , try a diffrent one' }, status: :not_acceptable
      else
        @guardian = current_user.guardians.create(user_params)
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
  end

  def destroy_guardian
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

  def user_params
    params.permit(:first_name, :last_name, :relationship, :email, :phone, :location, :password)
  end
end
