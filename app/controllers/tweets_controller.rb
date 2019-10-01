class TweetsController < ApplicationController
before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.order("id DESC").page(params[:page]).per(12)
  end

  def new
    @genre = Genre.all
  end

  def create
    binding.pry
    Tweet.create(text: tweet_params[:text], genre_id: tweet_params[:genre_id], user_id:current_user.id)
  end


  private
  def tweet_params
    params.require(:tweet).permit(:text, :genre_id)
  end



  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
