Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :resources
  resources :local_resources
  resources :feedbacks
  post '/save_answers', to: 'responses#create', as: 'save_answers'
  resources :surveys do
    resources :responses
    member do
      get 'select_language'
    end
  end
  get 'get_questions/:survey_id/:language' , to: 'questions#get_questions', as: :get_questions
  resources :questions
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  root "home#index"

  get '/about_us', to: 'home#about_us'
  get '/contact_us', to: 'home#contact_us'
  get '/show_all_responses', to: 'responses#show_all_responses'
  get '/feedback', to: 'resources#feedback'
end
