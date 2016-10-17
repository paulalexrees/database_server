class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set
    key = params.keys.first
    value = params[key]
    if Rails.cache.exist?(key)
      Rails.cache.write(key, value)
    else
      Rails.cache.fetch(key) { value }
    end
    render nothing: true
  end

  def get
    requested_key = params[:key]
    value = Rails.cache.fetch(requested_key)
    render plain: value
  end

end
