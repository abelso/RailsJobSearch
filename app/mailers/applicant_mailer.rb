class ApplicantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.application_notice.subject
  #
  def application_notice(application, job)
    @application = application
    @job = job

    mail to: @application.email, subject: "Prijava za posao: " + @job.title
  end
end
