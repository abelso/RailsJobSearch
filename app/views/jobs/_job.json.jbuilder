json.extract! job, :id, :title, :description, :name, :email, :category, :deadline, :created_at, :updated_at
json.url job_url(job, format: :json)
