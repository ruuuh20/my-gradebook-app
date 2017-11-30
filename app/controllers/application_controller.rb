class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || root_path
end

def must_be_admin
  unless current_user.admin?
    redirect_to root_path, :alert => "Access denied"
  end
end

def must_be_admin_or_teacher
  unless current_user.admin? || current_user.teacher?
    redirect_to root_path, :alert => "Access denied"
  end
end


end
