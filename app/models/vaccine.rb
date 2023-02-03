class Vaccine < ApplicationRecord
  belongs_to :ward

  scope :due, -> { where('vaccination_date <= ?', Date.today).order(:vaccination_date) }
  scope :upcoming, -> { where('vaccination_date > ?', Date.today).order(:vaccination_date) }
  scope :completed, -> { where(completed: true) }
end
