class ApplicationController < ActionController::Base
  before_action :render_menu
  protect_from_forgery with: :exception

  def render_menu

    if (!session["user_id"].nil?)
      @user = User.find(session["user_id"]);
    end
    @Contents = CustomizedContent.all;

  end

end
