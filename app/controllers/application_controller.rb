require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  #Create route flow
  get '/articles/new' do
  erb :new
  end
  
  post '/articles' do
    article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end
  
  
  #finding a single article by ID
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  
  #finding all the articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  
  # edit route flow - get & patch
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end
  
  
  # Delete an article when an ID is given
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
  
end