helpers do
  def create_user
    @user = User.create(name: params[:name], email: params[:email], password_hash: params[:password])
    @user.password = params[:password]
    session[:user_id] = @user.id
    @user.save
    @user
  end
end
