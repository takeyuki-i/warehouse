class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      @user_mail = current_user.email
      AlarmMailer.send_confirm_to_user(@user_mail).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
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
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    end
  end



  private

  def item_params
    params.require(:item).permit(:name,:image).merge(user_id: current_user.id)
  end

end