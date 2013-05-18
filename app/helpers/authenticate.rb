helpers do
  def authenticate(email,password)
    p "Inside Function"
    @user = User.find_by_email(params[:email])
    # p @user
    if @user.password == params[:password]
      p "Password matches"
      session[:user_id] = @user.id
      p session[:user_id]
    else
      redirect "/"
    end
  end
end
