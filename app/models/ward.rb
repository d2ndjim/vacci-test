class Ward < ApplicationRecord
  
  has_and_belongs_to_many :user
  has_many :immunizations, dependent: :destroy


  has_one_attached :avatar

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

  def self.immunization_schedules(ward)
    ward.immunizations.create(vaccination_type: 'w6', vaccination_date: ward.date_of_birth + 6.weeks)
    ward.immunizations.create(vaccination_type: 'w10', vaccination_date: ward.date_of_birth + 10.weeks)
    ward.immunizations.create(vaccination_type: 'w14', vaccination_date: ward.date_of_birth + 14.weeks)
    ward.immunizations.create(vaccination_type: 'm6', vaccination_date: ward.date_of_birth + 6.months)
    ward.immunizations.create(vaccination_type: 'm9', vaccination_date: ward.date_of_birth + 9.months)
    ward.immunizations.create(vaccination_type: 'm12', vaccination_date: ward.date_of_birth + 12.months)
    ward.immunizations.create(vaccination_type: 'm15', vaccination_date: ward.date_of_birth + 15.months)
  end
end
