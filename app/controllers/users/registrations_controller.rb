class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_params, only: :create

  def create
    # TODO: The confirmation controller should be overriden to handle the restful nature of the app.
    build_resource(sign_up_params)

    resource.save

    render_resource(resource)
  end

  def configure_permitted_params

    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        password_confirmation
        email_confirmation
        name
        avatar
      ]
    )
  end

  private :configure_permitted_params
end
