class RegistrationsController < ApplicationController

  def new
    resource = build_resource({})
    respond_with resource
  end
  protected

  def after_sign_up_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || profile_path(resource.profile)
  end

end

