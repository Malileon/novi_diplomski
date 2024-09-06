Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  resources :topics do
    resources :quizzes do
      resources :text_input_questions, except: [:index, :show]
      resources :choice_questions, except: [:index, :show] do
        resources :choices, except: [:index, :show]
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
