class ApplicationController < ActionController::Base
  before_action :render_menu
  protect_from_forgery with: :exception

  def render_menu

    if User.all.length == 0
      user = User.new()
      user.name = "admin"
      user.login = "admin"
      user.login_type = "admin"
      user.password = "admin"
      user.save()

      session["user_id"] = user.id
    end


    if (!session["user_id"].nil?)
      @user = User.find(session["user_id"]);
    end
    @Contents = CustomizedContent.all;

  end

end
