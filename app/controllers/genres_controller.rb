class GenresController < ApplicationController

  def show
    @genre = Genre.includes(tweets: :user).find(params[:id])
    @tweets = @genre.tweets.where(genre_id: params[:id]).order("id DESC").page(params[:page]).per(6)
  end

end
