class Vaccine < ApplicationRecord
  belongs_to :ward

  scope :due, -> { where('vaccination_date <= ? and completed != ?', Date.today, true).order(:vaccination_date) }
  scope :upcoming, -> { where('vaccination_date > ? and completed != ?', Date.today, true).order(:vaccination_date) }
  scope :completed, -> { where(completed: true) }

  validates :name, presence: true
  validates :vaccination_date, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :vaccination_type, presence: true
end
