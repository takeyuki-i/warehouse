class ApplicationController < ActionController::Base
before_action :devise_patameters, if: :devise_controller?
before_action :set_date
before_action :alarm_data

private
def devise_patameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:name,:address,:alarm_email] )
end

def set_date
  @today = Date.today
end

def alarm_data
  @items = Item.all
  @states = State.all
end

end