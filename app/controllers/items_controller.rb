class ItemsController < ApplicationController

  def index
    @items = Item.all
    @today = Date.today
    @states = State.all
  end

    # @state = State.find_by(id: 3)
    # @item = @state.item.name
    # binding.pry

  # @item = Item.find(params[:id])
  # @check_buy = @item.order.present?


    # @limit_day = State.find_by(params[1])[:alarm_day]
    # @limit_day_date = @limit_day.to_date
    # @alarm_day = @limit_day_date - @today


  # @past_diary = Diary.find_by(created_at: Date.today.prev_year.all_day)
  # @past_diaries = Diary.where(created_at: Date.today.prev_year.all_day)
  # @today_diary = Diary.find_by(created_at: Date.today.all_day)
  # @today_diaries = Diary.where(created_at: Date.today.all_day)
  # @next_diary = Diary.find_by(created_at: Date.today.next_year.all_day)
  # @next_diaries = Diary.where(created_at: Date.today.next_year.all_day)
  # # @goals = Goal.where(user_id: LIKE(?) , "#{@diary}")
  # @goals = Goal.where(user_id: @diary.user_id)
  # @comment = Comment.new
  # @comments = @diary.comments.includes(:user)

  def new
    @item = Item.new
    @today = Date.today
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
    params.require(:item).permit(:name,:image).merge(user_id: current_user.id)
  end

end