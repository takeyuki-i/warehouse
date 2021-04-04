class StatesController < ApplicationController
  before_action :set_item, only: [:new,:create,:edit,:update,:destroy]

  def new
    @state = State.new
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


  private

  def state_params
    params.require(:state).permit(:quantity,:unit_id,:limit_id,:limit_day,:alarm_id,:alarm_day,:storage_name,:storage_address).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end