class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if (verifyDuplicatedLogin(@user.login))
      respond_to do |format|
        flash[:message] = "The chosen  login already exist"
        format.html {render :new}

      end
    else
      respond_to do |format|
        if @user.save
          format.html {redirect_to @user, notice: 'User was successfully created.'}
          format.json {render :show, status: :created, location: @user}
        else
          format.html {render :new}
          format.json {render json: @user.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if (verifyDuplicatedLoginUpdate(@user.login, @user.id))
      respond_to do |format|
        flash[:message] = "The choose login already exist"
        format.html {render :new}

      end
    else
      respond_to do |format|
        if @user.update(user_params)
          format.html {redirect_to @user, notice: 'User was successfully updated.'}
          format.json {render :show, status: :ok, location: @user}
        else
          format.html {render :edit}
          format.json {render json: @user.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  def verifyDuplicatedLogin(login)
    if User.where(["login = ?", login]).length > 0
      return true
    else
      return false
    end

  end


  def verifyDuplicatedLoginUpdate(login, id)
    if User.where(["login = ? and id <> ?", login, id]).length > 0
      return true
    else
      return false
    end

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :login, :password, :password_confirmation, :login_type, :email, :phone, :role)
  end
end
