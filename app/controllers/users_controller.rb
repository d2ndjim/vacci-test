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

  def upload_avatar
    if logged_in?
      current_user.avatar.attach(params[:avatar])
      render json: { message: 'Image Uploaded' }, status: :ok
    else
      render json: { error: 'You are not logged in' }, status: :unauthorized
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

  private

  def user_params
    params.permit(:first_name, :last_name, :relationship, :email, :password)
  end
end
