class FishingsController < ApplicationController

  def index
    @fishing = Fishing.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @fishing = Fishing.new
  end

  def show
    @fishing = Fishing.find(params[:id])
    @comment = Comment.new
    @comments = @fishing.comments.includes(:user)
  end

  def create
    @fishing = Fishing.new(fishing_params)
  if
    @fishing.save
    redirect_to root_path
  else
    render :new
  end
  end

  def edit
    @fishing = Fishing.find(params[:id])
    if current_user != @fishing.user
      redirect_to action: :index
    end
  end

  def update
    @fishing = Fishing.find(params[:id])
    if @fishing.update(fishing_params)
      redirect_to action: "show"
    else
      render :edit
    end
  end

  def destroy
    fishing = Fishing.find(params[:id])
    fishing.destroy
    redirect_to root_path
  end

  def search
    @fishings = Fishing.search(params[:keyword])
  end


  private
  def fishing_params
    params.require(:fishing).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end

end
