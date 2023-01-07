class ApplicationController < ActionController::API
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  
  def jwt_key
    Figaro.env.jwt_key
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id }, jwt_key, 'HS256')
  end

  def decoded_token
    JWT.decode(token, jwt_key, true, { algorithm: 'HS256' })
  rescue StandardError => e
    [{ error: e }]
  end

  def token
    request.headers['Authorization'].split.last
  end

  def user_id
    decoded_token.first['user_id']
  end

  def current_user
    User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def admin?
    logged_in? && (current_user.relationship == 'mother' || current_user.relationship == 'father')
  end

  

  private

  def load_user
    @user = User.find(params[:id])
  end

end