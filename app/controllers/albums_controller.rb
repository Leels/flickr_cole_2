class AlbumsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action only: [:edit, :update, :destroy] do
        creator_auth(Album.find(params[:id]).user_id)
    end

    def new
    @user = User.find(session[:user_id])
    @album = @user.albums.new
    render :new
  end

  def create
    @user = User.find(session[:user_id])
    @album = @user.albums.new(album_params)
    if @album.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @album = Question.find(params[:id])
    render :edit
  end

  def show
    @user = User.find_by('username = ?', params[:username])
    @album = Question.find(params[:id])
    render :show
  end

  def update
    @album = Question.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Question.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private
      def album_params
        params.require(:album).permit(:name, :description, :user_id)
      end


end
