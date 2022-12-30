# typed: true
# frozen_string_literal: true

module Madmin
  class ApplicationController < Madmin::BaseController
    before_action :authenticate_admin_user

    def authenticate_admin_user
      session = Session.find_by(id: cookies.signed[:session_token])
      redirect_to "/" if session.blank?

      Current.session = session
      redirect_to "/" unless Current.user.admin
    end
  end
end
