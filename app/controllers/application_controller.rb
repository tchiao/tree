class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :show_navbar, :disable_nav
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def show_navbar
  	@categories = Category.all
  end

  def disable_nav
  	@disable_nav = true
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
