class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
  @tweets = Tweet.where(user_id: params[:id]).includes(:genre,:user).order("id DESC").page(params[:page]).per(6)
end

end