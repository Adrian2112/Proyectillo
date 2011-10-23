Calmecac::Application.routes.draw do
  
  get 'curso_profesor/:profesor_id/:curso_id', :controller => :curso_profesor, :action => 'curso_profesor'

  resources :autenticaciones

  devise_for :usuarios, :controllers => {:registrations => 'registrations'}
  
  # Match con la response de los provedores de redes sociales
  match '/auth/:provider/callback' => 'autenticaciones#create's

  match 'sobre_nosotros' => 'pages#about_us', :as => :about_us
  match 'terminos_de_uso' => 'pages#terms_of_use', :as => :terms_of_use
  match 'privacidad' => 'pages#privacy', :as => :privacy
  match 'aviso_legal' => 'pages#legal_advisor', :as => :legal_advisor
  match 'registrate' => 'usuarios#sign_up', :as => :signup
  match 'inicia_sesion' => 'sessions#sign_in', :as => :login

  match 'contacto' => 'contact#new', :as => 'contact', :via => :get
  match 'contacto' => 'contact#create', :as => 'contact', :via => :post
  
  get 'pages/mas_resultados'
  
  resources :universidades, :shallow => true do
    
    collection do
      get "mas_universidades"
    end
    
    resources :campus, :shallow => true do
      resources :cursos
    end
  end

  resources :calificaciones
  resources :profesores
  resources :comentarios

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "pages#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
