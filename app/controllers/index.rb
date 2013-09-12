# GET ===========================================
get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/create_user' do
  erb :create_user
end

get '/all_createdevents' do

end

get '/all_attendedevents' do
end

get '/user/profile' do
	if logged_in?
    @attended_events = current_user.attended_events
    @created_events = current_user.created_events
    erb :profile
  else
    redirect('/login')
  end
end

get '/logout' do
	session.clear
  redirect '/'
end


# POST ==========================================

post '/login' do
  @user = User.find_by_email(params[:email])

  if @user && @user.authenticate(params[:email][:password_digest])
    session[:user_id] = @user.id
    redirect('/user/profile')
  else
    @error = "User could not be authenticated"
    erb :login
  end
end

post '/create_user' do  
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect to '/user/profile'
  else
    @error = "Error creating user: please try again"
    erb :create_user
  end
end





