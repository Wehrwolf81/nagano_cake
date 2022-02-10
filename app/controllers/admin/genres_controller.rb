class Admin::GenresController < ApplicationController


def index
  @genres=Genre.all
  @new_genre=Genre.new

end

def create
  @new_genre=Genre.new(genre_params)
  if @new_genre.save
  redirect_to admin_genres_path,notice:'You have updeted user successfully.'
  else
  flash.now[:alert]='create error'
  @genres=Genre.all
  render :index
  end
end

def edit
  @genre = Genre.find(params[:id])
end

def update
  @genre = Genre.find(params[:id])
  if @genre.update(genre_params)
  redirect_to admin_genres_path,notice:'You have updeted user successfully.'
  else
  flash.now[:alert]='update error'
  render :edit
  end
end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end