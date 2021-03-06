class SubsController < ApplicationController
  before_action :require_moderator, only:[:edit, :update]
 
  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub=Sub.find(params[:id])
    render :show
  end

  def new
    @sub=Sub.new
    render :new
  end

  def create
    @sub=Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save!
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub=Sub.find(params[:id])
    render :edit
  end

  def update
    @sub=Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title,:description)
  end

  def require_moderator
      @sub = Sub.find(params[:id])
      render json: "Forbidden" if current_user.id != @sub.moderator_id
  end
end
