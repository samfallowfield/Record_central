class UsersController < ApplicationController
  before_action :set_user, only:[:show, :update, :edit, :destroy]

  before_action :require_user, only:[:edit, :update, :destroy]
  before_action :require_same_user, only:[:edit, :update, :destroy]

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
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all listings have been deleted"
    redirect_to records_path
  end


  private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = " You can only edit or delete your own account!"
      redirect_to @user
    end
  end

end
