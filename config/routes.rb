Rails.application.routes.draw do
  scope '/ivy-imdb' do
    post '/people/:birthday', to: 'people#create'
    # get '/people/:birthday', to: 'people#show'
  end
end
