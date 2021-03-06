Rails.application.routes.draw do
  devise_for :people do
    get "/people/sign_out" => "devise/sessions#destroy", :as => :destroy_person_session
  end
  authenticate :person do
      resources :courses do
        resources :enrollments
        member do
            get 'students', to: 'courses#students'
            get 'assignments', to: 'courses#assignments'
        end
        resources :assignments do
          resources :grades
        end
      end
      resources :people
      root to: 'courses#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
