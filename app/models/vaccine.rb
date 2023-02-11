class Vaccine < ApplicationRecord
  default_scope { order(id: :asc) }

  belongs_to :ward

  scope :due, -> { where('vaccination_date <= ? and completed != ?', Date.today, true).order('vaccination_date ASC') }
  scope :upcoming, -> { where('vaccination_date > ? and completed != ?', Date.today, true).order('vaccination_date ASC') }
  scope :completed, -> { where(completed: true).order('vaccination_date ASC') }

  validates :name, presence: true
  validates :vaccination_date, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :vaccination_type, presence: true
end
