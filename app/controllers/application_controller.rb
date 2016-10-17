class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set
    key = params.keys.first
    value = params[key]
    session[key] = value
    render nothing: true
  end

  def get
    requested_key = params[:key]
    value = session[requested_key]
    render plain: value
  end

end
