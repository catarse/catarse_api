module CatarseApi
  class ApplicationController < ActionController::Base
    before_filter :authenticate_user_from_token!

    helper_method :current_user
    respond_to :json

    private

    def authenticate_user_from_token!
      user_email = params[:user_email].presence
      user       = user_email && ::User.find_by_email(user_email)

      if user && CatarseApi.secure_compare(user.authentication_token, params[:user_token])
        @signed_user = user
      else
        render json: { error: "invalid credentials!"}, status: 403
      end
    end

    def current_user
      @signed_user
    end
  end
end
