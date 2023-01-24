class ImmunizationScheduleReminderJob
  include Sidekiq::Job

  def perform(ward_id)
    schedule = Immunization.where(ward_id: ward_id)
    ward = Ward.find(ward_id)
    users = ward.user
    today = Date.today
    if today == schedule.w6
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.w6).deliver_now
    elsif today == schedule.w10
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.w10).deliver_now
    elsif today == schedule.w14
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.w14).deliver_now
    elsif today == schedule.m6
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.m6).deliver_now
    elsif today == schedule.m9
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.m9).deliver_now
    elsif today == schedule.m12
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.m12).deliver_now
    elsif today == schedule.m15
      ImmunizationScheduleMailer.reminder_email(users, ward, schedule.m15).deliver_now
    else
      puts 'No schedule for today'
    end
  end
end
