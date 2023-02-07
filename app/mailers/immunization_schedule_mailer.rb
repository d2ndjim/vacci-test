class ImmunizationScheduleMailer < ApplicationMailer
  def reminder_email(user, ward)
    @ward = ward
    # @schedule = schedule
    to_emails = user.email
    mail(to: to_emails, subject: "Reminder: Upcoming Immunization for #{@ward.first_name} #{@ward.last_name}")
  end
end
