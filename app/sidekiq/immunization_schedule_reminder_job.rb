class ImmunizationScheduleReminderJob
  include Sidekiq::Job

  def perform()
    immunizations = Immunization.all
    filtered_immunizations = immunizations.select do |immunization|
      immunization.vaccination_date == Date.today + immunization.reminder_days.days
    end
    # binding.pry
    filtered_immunizations.each do |immunization|
      ImmunizationScheduleMailer.reminder_email(immunization.ward.user, immunization.ward).deliver_now
    end
  end
end
