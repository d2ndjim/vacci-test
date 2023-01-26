class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  belongs_to :guardian, class_name: 'User', optional: true
  has_many :guardians, class_name: 'User', foreign_key: 'guardian_id'
  has_and_belongs_to_many :wards
end
