class LoginController < ApplicationController

  def index


  end

  def logout
    session.delete(:user_id)
    respond_to do |format|
      format.html {redirect_to "/"}
    end
  end

  def authenticate

    user = User.find_by(login: params["login"]["login"]);
    if user

      auth = user.authenticate(params["login"]["password"]);
      if !auth
        flash[:message] = "Incorrect password"
        render :index
      else
        session["user_id"] = user.id
        respond_to do |format|
          format.html {redirect_to "/", notice: user.name}

        end
      end

    else
      flash[:message] = "User not found"

      render :index
    end
  end
end
