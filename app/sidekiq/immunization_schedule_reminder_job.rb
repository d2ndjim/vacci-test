class ImmunizationScheduleReminderJob
  include Sidekiq::Job

  def perform()
    immunizations = Immunization.where(vaccination_date: Date.today + 1.day)
    immunizations.each do |immunization|
      ImmunizationScheduleMailer.reminder_email(immunization.ward.user, immunization.ward,  immunization.vaccination_date).deliver_now
    end
  end
end
