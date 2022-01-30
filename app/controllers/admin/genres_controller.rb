class Admin::GenresController < ApplicationController
end

def index
  @genres=Genre.all
  @new_genre=Genre.new
end  

def create
  @new_genre=Genre.new
end  

def edit
  @genre = Genre.find(params[:id])
end  

def update
  @genre = Genre.find(params[:id])
  if @genre.update(customer_params)
  redirect_to genres_path(@genre.id),notice:'You have updeted user successfully.'
  else
  flash.now[:alert]='update error'
  render :edit
  end
end  
