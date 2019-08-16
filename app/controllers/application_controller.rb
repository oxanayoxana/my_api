# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Flash
  include ::ActionView::Layouts
  include ::ActionController::Helpers
  include ::ActionController::MimeResponds
  include ::ActionController::RequestForgeryProtection
  # protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token, raise: false

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  include Knock::Authenticable

  private

  def not_found
    render json: 'Not Found', status: :not_found
  end
end
