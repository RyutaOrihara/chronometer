class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:index]
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
    @favorites = current_user.favorites
  end

private

  def user_params
    params.require(:user).permit(:image,:image_cache)
  end
end
