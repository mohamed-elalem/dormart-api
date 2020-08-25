class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit
  include ::ActionView::Layouts
  layout 'application'

  respond_to :json
  
  prepend_before_action :authenticate_user_by_type, unless: :devise_controller?


  def render_resource(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: resource.errors
    }, status: :bad_request
  end

  def me
    @user = current_customer || current_shop
    render 'users/me'
  end

  def pundit_user
    current_shop || current_customer
  end

  private

  def authenticate_user_by_type
    if current_shop
      authenticate_shop!
    else
      authenticate_customer!
    end
  end
end
