class ApplicationController < ActionController::Base
before_action :devise_patameters, if: :devise_controller?

private
def devise_patameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:name,:address] )
end

end