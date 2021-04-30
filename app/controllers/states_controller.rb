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

  def search
    @items = Item.all
  end

  def search_firstinout
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id]).order("created_at ASC")
  end

  def search_lastinout
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id]).order("created_at DESC")
  end

  def search_exdate
    @item = Item.find(params[:id])
    @states = State.where(item_id: params[:id]).order("limit_day ASC")
  end

  def alarm
    @items = Item.all
    @states = State.all

    @user_mail = current_user.alarm_email
    if AlarmMailer.alarm_mail(@user_mail,@items,@states,@today).deliver
      redirect_to root_path
    end
  end

  def search_limit
    @states = State.all.order("item_id ASC")
    @test = []
    @states.each do |state|
      if state.limit_id == 2
          limit_day = state.limit_day.to_date
          alarm = limit_day - @today
          if alarm < 0
            @test << state
          end
      end
    end
  end














  
  private

  def state_params
    params.require(:state).permit(:quantity,:unit_id,:limit_id,:limit_day,:storage_name,:storage_address).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end