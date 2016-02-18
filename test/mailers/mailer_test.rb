require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "notify_incoming_request" do
    mail = Mailer.notify_incoming_request
    assert_equal "Notify incoming request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_changed_request_status" do
    mail = Mailer.notify_changed_request_status
    assert_equal "Notify changed request status", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
