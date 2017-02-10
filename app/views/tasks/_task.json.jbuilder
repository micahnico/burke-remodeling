json.extract! task, :id, :title, :details, :text_alert, :due_at, :completed_at, :completed, :created_at, :updated_at
json.url task_url(task, format: :json)