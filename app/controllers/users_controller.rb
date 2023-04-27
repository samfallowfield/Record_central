class UsersController < ApplicationController
  before_action :set_user, only:[:show, :update, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Record Central #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @records = @user.records.paginate(page: params[:page], per_page: 8)
  end

  def index
    @users = User.all
  end

  def edit

  end

  def update
    if User.update(user_params)
      flash[:notice] = "Account updated!"
      redirect_to @user
    else
      render edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
