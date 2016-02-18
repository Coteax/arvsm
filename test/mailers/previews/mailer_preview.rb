# Preview all emails at http://localhost:3000/rails/mailers/mailer
class MailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailer/notify_incoming_request
  def notify_incoming_request
    Mailer.notify_incoming_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/mailer/notify_changed_request_status
  def notify_changed_request_status
    Mailer.notify_changed_request_status
  end

end
