class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_variant

  def index
    # for clarity, but these lines aren't needed:
    respond_to do |format|
      format.html
      # format.html.phone
      format.html.mobile
      format.html.tablet
    end
  end

  private

    def device_type
      request.env['mobvious.device_type']
    end
    helper_method :device_type

    def set_variant
      # we can do something like this if we want to use :phone variant (instead of :mobile)
      # request.variant = { mobile: :phone, tablet: :tablet }[device_type]
      request.variant = device_type
    end
end
