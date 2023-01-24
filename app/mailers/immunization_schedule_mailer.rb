class ImmunizationScheduleMailer < ApplicationMailer
  def reminder_email(users, child, schedule)
    @child = child
    @schedule = schedule
    to_emails = users.map(&:email)
    mail(to: to_emails, subject: "Reminder: Upcoming Immunization for #{@child.first_name} #{@child.last_name}")
  end
end
