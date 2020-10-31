class CompanyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_mailer.application_notice.subject
  #
  def application_notice(application, job, cv_path)
    @application = application
    @job = job

    if cv_path
      attachments[@application.first_name + "_" + @application.last_name + "_CV" + File.extname(cv_path)] = File.read(cv_path, mode: "rb")
    end
    mail to: @job.email, subject: "Prijava za posao: " + @job.title
  end
end
