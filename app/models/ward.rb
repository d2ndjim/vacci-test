class Ward < ApplicationRecord
  belongs_to :user
  has_many :immunizations, dependent: :destroy
  has_many :vaccines, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :height, presence: true
  validates :weight, presence: true

  has_one_attached :avatar

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

  def self.immunization_schedules(ward)
    ward.immunizations.create(name: 'DTwP-Hib-HepB (Whole cell) vaccine, IPV, OPV and PCV-10', vaccination_type: 'w6',
                              vaccination_date: ward.date_of_birth + 6.weeks)
    ward.immunizations.create(name: 'DTwP-Hib-HepB (Whole cell) vaccine, OPV, and PCV-10', vaccination_type: 'w10',
                              vaccination_date: ward.date_of_birth + 10.weeks)
    ward.immunizations.create(name: 'DTwP-Hib-HepB (Whole cell) vaccine, OPV, IPV, and PCV-10', vaccination_type: 'w14',
                              vaccination_date: ward.date_of_birth + 14.weeks)
    ward.immunizations.create(name: 'Vitamin A supplements', vaccination_type: 'm6', vaccination_date: ward.date_of_birth + 6.months)
    ward.immunizations.create(name: 'Measles vaccine, YF (Yellow fever) vaccine, +1', vaccination_type: 'm9',
                              vaccination_date: ward.date_of_birth + 9.months)
    ward.immunizations.create(name: 'Vitamin A supplements', vaccination_type: 'm12', vaccination_date: ward.date_of_birth + 12.months)
    ward.immunizations.create(name: 'Measles vaccine', vaccination_type: 'm15', vaccination_date: ward.date_of_birth + 15.months)
  end

  def self.vaccine_trackers(ward)
    ward.vaccines.create(name: 'BCG (Baccille Calmette Guérin) vaccine', vaccination_type: 'Month 0', vaccination_date: ward.date_of_birth)
    ward.vaccines.create(name: 'OPV (Oral Polio Vaccine)', vaccination_type: 'Month 0', vaccination_date: ward.date_of_birth)
    ward.vaccines.create(name: 'Pediatric Hepatitis B vaccine', vaccination_type: 'Month 0', vaccination_date: ward.date_of_birth)
    ward.vaccines.create(name: 'DTwP-Hib-HepB (Whole cell) vaccine', vaccination_type: '6 Weeks', vaccination_date: ward.date_of_birth + 6.weeks)
    ward.vaccines.create(name: 'IPV (Inactivated Polio Vaccine)', vaccination_type: '6 Weeks', vaccination_date: ward.date_of_birth + 6.weeks)
    ward.vaccines.create(name: 'OPV (Oral Polio Vaccine)', vaccination_type: '6 Weeks', vaccination_date: ward.date_of_birth + 6.weeks)
    ward.vaccines.create(name: 'PCV-10 (Pneumococcal C vaccine)', vaccination_type: '6 Weeks', vaccination_date: ward.date_of_birth + 6.weeks)
    ward.vaccines.create(name: 'DTwP-Hib-HepB (Whole cell) vaccine', vaccination_type: '10 Weeks', vaccination_date: ward.date_of_birth + 10.weeks)
    ward.vaccines.create(name: 'OPV (Oral Polio Vaccine)', vaccination_type: '10 Weeks', vaccination_date: ward.date_of_birth + 10.weeks)
    ward.vaccines.create(name: 'PCV-10 (Pneumococcal C vaccine)', vaccination_type: '10 Weeks',
                         vaccination_date: ward.date_of_birth + 10.weeks)
    ward.vaccines.create(name: 'DTwP-Hib-HepB (Whole cell) vaccine', vaccination_type: '14 Weeks', vaccination_date: ward.date_of_birth + 14.weeks)
    ward.vaccines.create(name: 'OPV (Oral Polio Vaccine)', vaccination_type: '14 Weeks', vaccination_date: ward.date_of_birth + 14.weeks)
    ward.vaccines.create(name: 'IPV (Inactivated Polio Vaccine)', vaccination_type: '14 Weeks', vaccination_date: ward.date_of_birth + 14.weeks)
    ward.vaccines.create(name: 'PCV-10 (Pneumococcal C vaccine)', vaccination_type: '14 Weeks',
                         vaccination_date: ward.date_of_birth + 14.weeks)
    ward.vaccines.create(name: 'Vitamin A supplements', vaccination_type: '6 Months', vaccination_date: ward.date_of_birth + 6.months)
    ward.vaccines.create(name: 'Measles vaccine', vaccination_type: '9 Months', vaccination_date: ward.date_of_birth + 9.months)
    ward.vaccines.create(name: 'Meningococcal A conjugate vaccine', vaccination_type: '9 Months', vaccination_date: ward.date_of_birth + 9.months)
    ward.vaccines.create(name: 'YF (Yellow fever) vaccine', vaccination_type: '9 Months', vaccination_date: ward.date_of_birth + 9.months)
    ward.vaccines.create(name: 'Vitamin A supplements', vaccination_type: '12 Months', vaccination_date: ward.date_of_birth + 12.months)
    ward.vaccines.create(name: 'Measles vaccine', vaccination_type: '15 Months', vaccination_date: ward.date_of_birth + 15.months)
  end
end
