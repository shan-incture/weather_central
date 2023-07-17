Rails.application.routes.draw do
  get '/jobs/trigger_job', to: 'trigger_job#trigger_job', as: 'trigger_job'
end
