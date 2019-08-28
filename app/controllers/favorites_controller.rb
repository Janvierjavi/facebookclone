class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(facepost_id: params[:facepost_id])
        redirect_to faceposts_url, notice: "#{favorite.facepost.user.name}'s facepost has been favorited"
      end
    
      def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to faceposts_url, notice: "#{favorite.facepost.user.name}'s facepost has been unfavored"
      end
end
