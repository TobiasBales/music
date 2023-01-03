# typed: true
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  extend T::Sig

  include Pundit::Authorization

  before_action :set_current_request_details
  before_action :load_current_session

  private

  def authenticate
    if (session = Session.find_by(id: cookies.signed[:session_token]))
      Current.session = session
    else
      redirect_to sign_in_path
    end
  end

  def load_current_session
    session = Session.find_by(id: cookies.signed[:session_token])

    Current.session = session if session.present?
  end

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end

  sig { returns(T.nilable(User)) }
  def current_user
    Current.user
  end
end
