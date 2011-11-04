Calmecac::Application.routes.draw do
  
  get 'curso_profesor/:profesor_id/:curso_id', :controller => :cursos_profesores, :action => 'curso_profesor'

  resources :autenticaciones

  devise_for :usuarios, :controllers => {:registrations => 'registrations'}
  
  # Match con la response de los provedores de redes sociales
  match '/auth/:provider/callback' => 'autenticaciones#create'

  match 'sobre_nosotros' => 'pages#about_us', :as => :about_us
  match 'terminos_de_uso' => 'pages#terms_of_use', :as => :terms_of_use
  match 'privacidad' => 'pages#privacy', :as => :privacy
  match 'aviso_legal' => 'pages#legal_advisor', :as => :legal_advisor
  match 'registrate' => 'usuarios#sign_up', :as => :signup
  match 'inicia_sesion' => 'sessions#sign_in', :as => :login

  match 'contacto' => 'contact#new', :as => 'contact', :via => :get
  match 'contacto' => 'contact#create', :as => 'contact', :via => :post
  
  # Para invitacion masiva de contactos. Implementacion no habilitada a los usuarios. 
  #match 'invitar' => 'invitation#new', :as => 'invitation', :via => :get
  #match 'invitar' => 'invitation#create', :as => 'invitation', :via => :post
  

  get 'pages/mas_resultados'
  
  resources :universidades, :shallow => true do
    
    collection do
      get "mas_universidades"
    end
    
    resources :campus, :shallow => true do
      resources :cursos do
        collection do
          get "mas_resultados"
        end        
      end
    end
  end

  resources :calificaciones, :only => [:create] do
    member do
      post 'like'
      post 'flag'
    end
  end
  
  resources :profesores do
    collection do
      get "mas_resultados"
    end
  end
  
  resources :comentarios, :only => [:create]

  root :to => "pages#index"

end
