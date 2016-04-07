class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create
  before_action :configure_account_update_params, only: :update

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
