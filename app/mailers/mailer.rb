class Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.notify_incoming_request.subject
  #
  def notify_incoming_request
    mail(to: "kadmos@gmail.com",
         subject: "Gates Martin made an absense request")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.notify_changed_request_status.subject
  #
  def notify_changed_request_status
    mail(to: "kadmos@gmail.com",
         subject: "Gates Martin your request has")
  end
end
