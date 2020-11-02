class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show]
  before_action :set_job, only: [:index, :show]

  # GET /applications
  def index
    if current_user
      @applications = Application.where(job_id: @job.id)
    else
      @application = Application.new
      @application.job_id = @job.id
    end
  end

  # GET /applications/1
  def show
  end

  # GET /applications/new
  def new
  end

  # POST /applications
  def create
    @application = Application.new(application_params)
    @job = Job.find(@application.job_id)
    cv = params[:application][:cv]
    if cv
      cv_path = cv.tempfile.path
    end

    respond_to do |format|
      if @application.save
        ApplicantMailer.application_notice(@application, @job).deliver_now
        CompanyMailer.application_notice(@application, @job, cv_path).deliver_now
        format.html { redirect_to job_application_path(@job, @application), notice: 'Prijava uspješno kreirana.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    def set_job
      @job = Job.find(params["job_id"])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:first_name, :last_name, :dob, :email, :telephone, :address, :qualification, :job_id)
    end
end
