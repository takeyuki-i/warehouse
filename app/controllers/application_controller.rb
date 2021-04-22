class ApplicationController < ActionController::Base
before_action :devise_patameters, if: :devise_controller?
before_action :set_date

private
def devise_patameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:name,:address] )
end

def set_date
  @today = Date.today
end


end