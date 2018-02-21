Rails.application.routes.draw do
  scope '/ivy-imdb' do
    post '/actors/:birthday', to: 'actors#create'
    # get '/actors/:birthday', to: 'actors#show'
  end
end
