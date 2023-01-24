class ImmunizationScheduleReminderJob
  include Sidekiq::Job

  def perform()
    immunizations = Immunization.where(vaccination_date: Date.today + 1.day)
    immunizations.each do |immunization|
      ward = Ward.find(immunization.ward_id)
      users = ward.user
      date = immunization.vaccination_date
      ImmunizationScheduleMailer.reminder_email(users, ward, date).deliver_now
    end
  end
end
