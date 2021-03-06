class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @tweets = Tweet.includes(:user,:genre).where(genre_id: params[:id]).order("id DESC").page(params[:page]).per(6)
  end

end
