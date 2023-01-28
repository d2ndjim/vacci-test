class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

  belongs_to :guardian, class_name: 'User', optional: true
  has_many :guardians, class_name: 'User', foreign_key: 'guardian_id'
  has_and_belongs_to_many :wards
end
