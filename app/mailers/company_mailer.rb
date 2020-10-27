class CompanyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_mailer.application_notice.subject
  #
  def application_notice(application, job, cv)
    @application = application
    @job = job
    @cv = cv

    attachments[@application.first_name + "_" + @application.last_name + "_CV" + File.extname(@cv)] = File.read(@cv, mode: "rb")
    mail to: @job.email, subject: "Prijava za posao: " + @job.title
  end
end
