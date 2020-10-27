require 'test_helper'

class ApplicantMailerTest < ActionMailer::TestCase
  test "application_notice" do
    mail = ApplicantMailer.application_notice
    assert_equal "Application notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
