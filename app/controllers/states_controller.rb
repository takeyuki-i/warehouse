class StatesController < ApplicationController
  before_action :set_item, only: [:new,:create]

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

  private

  def state_params
    params.require(:state).permit(:quantity,:limit_id,:limit_day,:alarm_id,:alarm_day,:storage_name,:storage_address).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end