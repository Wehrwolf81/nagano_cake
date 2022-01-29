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
end  
