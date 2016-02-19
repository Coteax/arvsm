class Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.notify_incoming_request.subject
  #
  def notify_incoming_request(request)
    @request=request
    mail(to: request.user_assigned.email,
         subject: "#{request.user.name} made an absense request")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.notify_changed_request_status.subject
  #
  def notify_changed_request_status(request)
    @request=request
    mail(to: request.user.email,
         subject: "#{request.user.name} your request has been #{I18n.t "request_status.#{request.status}"}")
  end
end
