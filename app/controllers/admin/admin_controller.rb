# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authorize

    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
      redirect_to admin_login_url, alert: 'Not authorized' if current_user.nil?
    end

    def index; end
  end
end
