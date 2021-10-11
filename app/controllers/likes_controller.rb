class LikesController < ApplicationController

  def create
    current_user.like_this(clicked_fishing)
    flash[:success] = '投稿に「いいね！」しました。'
    redirect_back(fallback_location: root_path)
    # 前回の記事からelse以下の記述は削除
  end

  # ↓前回の記事からここを追記！
  def destroy
    current_user.likes.find_by(fishing_id: params[:fishing_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end


  private

  def clicked_fishing
    Fishing.find(params[:fishing_id])
  end
end
