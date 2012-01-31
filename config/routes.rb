Programmingfonts::Application.routes.draw do

  resources :fonts

  root :to => 'home#index'
end
