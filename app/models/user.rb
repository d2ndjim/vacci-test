class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

  has_many :wards
end
