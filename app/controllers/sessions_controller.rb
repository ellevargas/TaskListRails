class SessionsController < ApplicationController

    def index
      @user = User.find(session[:user_id]) # < recalls the value set in a previous request
    end

  def create
    auth_hash = request.env['omniauth.auth']

    flash[:notice] = "Login failed :("
    return redirect_to root_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
     @user = User.build_from_github(auth_hash)
     flash[:notice] = "Unable to save user"
     return redirect_to root_path unless @user.save
   end

   # Save the user ID in the session cookie
   session[:user_id] = @user.id

   flash[:notice] = "Successfully logged in!"
   redirect_to index_tasks_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logged out.'
  end

end
