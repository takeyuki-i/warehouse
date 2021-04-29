class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @today = Date.today
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      @user_mail = current_user.email
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @today = Date.today
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id])
    @today = Date.today
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:information,:image).merge(user_id: current_user.id)
  end


end