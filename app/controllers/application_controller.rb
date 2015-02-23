class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_variant

  def index
    # for clarity, but these lines aren't needed:
    respond_to do |format|
      format.html
      format.html.mobile
      format.html.tablet
    end
  end

  private

    def device_type
      browser.tablet? ? :tablet : browser.mobile? ? :mobile : :desktop
    end
    helper_method :device_type

    def set_variant
      request.variant = device_type
    end
end
