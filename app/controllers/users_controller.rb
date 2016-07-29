class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = get_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = get_user
  end

  def confirm_create
    @user = User.new(user_params)
    @user.avatar.cache! if @user.avatar?

    render :new if @user.invalid?
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    elsif @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def confirm_update
    @user = get_user
    @user.assign_attributes(user_params)
    render :edit if @user.invalid?
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = get_user
    if params[:back]
      @user.assign_attributes(user_params)
      return render :edit
    end

    @user.assign_attributes(user_params)
    @user.remove_avatar! if user_params[:is_avatar_removing] == '1'
    if @user.save
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = get_user
    @user.destroy

    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def get_user
      User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :avatar, :avatar_cache, :is_avatar_removing)
    end
end
