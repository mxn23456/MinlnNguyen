class ApplicationController < ActionController::Base
# This is our new function that comes before Devise's one
#before_filter :authenticate_user_from_token!
protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
acts_as_token_authentication_handler_for User

# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
#protect_from_forgery with: :exception
#skip_before_filter  :verify_authenticity_token
#before_action :configure_permitted_parameters, if: :devise_controller?
#before_action :authenticate_user! 

protected
#NOTE the following is deprecated in new Devise version. Update on Heroku if have problem
#  def configure_permitted_parameters
#      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email) }
#  end

#def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
#end

#private

#def authenticate_user_from_token!
#    user_email = params[:user_email].presence
#    user       = user_email && User.find_by_email(user_email)

#    # Notice how we use Devise.secure_compare to compare the token
#    # in the database with the token given in the params, mitigating
#    # timing attacks.
#    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
#        sign_in user, store: false
#    end
#end

    before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
    end

    rescue_from CanCan::AccessDenied do |exception|  
    respond_to do |format|  
    format.json { render :json=> exception.to_json, :status => :forbidden }  
    end   
    end
    end
