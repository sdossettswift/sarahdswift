Rails.application.routes.draw do

  get 'skills' => 'portfolio#skills', as: :skills
  get 'schooling' => 'portfolio#schooling', as: :schooling
  get 'portfolio' =>'portfolio#portfolio', as: :portfolio
  get 'contact' => 'portfolio#contact', as: :contact
  get 'resume'=> 'portfolio#resume', as: :resume
  get 'welcome'=> 'portfolio#welcome', as: :welcome

  root 'portfolio#welcome'
end
