Rails.application.routes.draw do
  root "pages#home"
  # get "about", to: 'pages#about'
  get 'pages/about'
  resources :articles

  def index
    @articles = Article.all
  end
end
