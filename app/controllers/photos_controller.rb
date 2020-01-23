class PhotosController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action only: [:edit, :update, :destroy] do
        creator_auth(Photo.find(params[:id]).user_id)
    end


end
