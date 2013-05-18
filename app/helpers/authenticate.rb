helpers do
  def authenticate
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      redirect "/play/#{@user.id}"
    else
      redirect "/"
    end
  end
end
