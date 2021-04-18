class StatesController < ApplicationController
  before_action :set_item, only: [:new,:create,:edit,:update,:destroy]

  def new
    @state = State.new
    @today = Date.today
  end

  def create
    @state = State.new(state_params)
    if @state.save
      redirect_to "/items/#{params[:item_id]}"
    else
      render action: :new
    end
  end

  def edit
    @state = State.find(params[:id])
    @today = Date.today
  end

  def update
    @state = State.find(params[:id])
    if @state.update(state_params)
      redirect_to "/items/#{params[:item_id]}"
    else
      render :edit
    end
  end


  def destroy
    @state = State.find(params[:id])
    if @state.destroy
      redirect_to "/items/#{params[:item_id]}"
    end
  end

  def search
    @items = Item.all
  end

  def search_firstinout
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id]).order("created_at ASC")
    @today = Date.today
  end

  def search_lastinout
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id]).order("created_at DESC")
    @today = Date.today
  end

  def search_exdate
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id]).order("limit_day ASC")
    @today = Date.today
  end

  def alarm
    @user_mail = current_user.email
    if AlarmMailer.send_confirm_to_user(@user_mail).deliver
      redirect_to root_path
    end
  end

  private

  def state_params
    params.require(:state).permit(:quantity,:unit_id,:limit_id,:limit_day,:alarm_id,:alarm_day,:storage_name,:storage_address).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end