Rails.application.routes.draw do
  get 'resume/resume'

  root 'portfolio#welcome'
end
