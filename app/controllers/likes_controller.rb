class LikesController < ApplicationController

  def create
    unless current_user.favorites.include?(clicked_fishing)
      like = current_user.likes.new(fishing_id: clicked_fishing.id)

      if like.save
        flash[:success] = '投稿に「いいね！」しました。'
        redirect_back(fallback_location: root_path)
      end

    else
      flash[:alert] = 'すでに「いいね！」しています。'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def clicked_fishing
    Fishing.find(params[:fishing_id])
  end
end
