class TweetsController < ApplicationController
before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user,:genre).order("id DESC").page(params[:page]).per(12)
  end

  def new
    @genre = Genre.all
  end

  def create
    Tweet.create(text: tweet_params[:text], genre_id: tweet_params[:genre_id], user_id:current_user.id)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @userstweets = Tweet.where(user_id: @tweet.user_id).order("id DESC").limit(6)
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @genre = Genre.all
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
    redirect_to action: :index
  end

  def destroy
    tweet = Tweet.find(params[:id])
      tweet.destroy if tweet.user_id == current_user.id
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :genre_id)
  end



  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
