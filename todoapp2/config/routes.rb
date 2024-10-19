resources :categories do
  resources :tasks, only: [:index, :create, :destroy] do
    member do
      patch :complete
    end
  end
end
