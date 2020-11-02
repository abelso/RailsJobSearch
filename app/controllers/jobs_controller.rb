class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.all.order(:created_at)
  end

  # GET /jobs/1
  def show
    redirect_to job_applications_path(@job)
  end

  # GET /jobs/new
  def new
    redirect_to root_path unless current_user
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    redirect_to root_path unless current_user
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Posao uspješno kreiran.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /jobs/1
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Posao uspješno ažuriran.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Posao uspješno izbrisan.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:title, :description, :name, :email, :category, :deadline)
    end
end
