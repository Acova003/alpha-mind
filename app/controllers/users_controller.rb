class UsersController < ApplicationController

  # GET: /users

  #render form
  get '/login' do
    erb :login
  end

  #create a session
  post '/login' do
    #recieve the input from login form
    #find user
    #authenticate user
    #log them in- creating a session
    @user = User.create(params[:user])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      #log them in -creating a sessions
      #redirects to user profile
      redirect "users/#{@user.id}"
    else
      #show error
      #redirect to login mapge
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

  # PATCH: /users/5
  patch "/users/:id" do
    #we are getting id from url ^
    @user = User.find_by(id: params[:id])
    erb :show
  end

  #what routes do we need for signup?
  get '/signup' do
    #render my sign form
    #that form would point to a post '/users' method
  end

  post '/users' do
    #only create user is they provide username, email, and password
    #if all data is present
      #add key/value pair
      #redirect to user profile
    #else
      #try again
    redirect_if_not_logged_in?
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
