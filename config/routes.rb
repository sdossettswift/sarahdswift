Rails.application.routes.draw do


  ##get 'users/new' commented out to prevent abuse

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete', as: :end_session
  get 'sign_out' => 'sessions#delete', as: :sign_out

  resources :projects
  get 'skills' => 'portfolio#skills', as: :skills
  get 'schooling' => 'portfolio#schooling', as: :schooling
  get 'portfolio' =>'portfolio#portfolio', as: :portfolio
  get 'contact' => 'portfolio#contact', as: :contact
  get 'resume'=> 'portfolio#resume', as: :resume
  get 'welcome'=> 'portfolio#welcome', as: :welcome

  root 'portfolio#welcome'
end
