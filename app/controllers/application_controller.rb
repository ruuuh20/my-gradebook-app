class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || root_path
end

def admin_only
  unless current_user.admin?
    redirect_to root_path, :alert => "Access denied"
  end
end


end
