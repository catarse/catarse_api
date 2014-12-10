module CatarseApi
  module V1
    class AuthenticateController < CatarseApi::ApplicationController
      SERIALIZER = CatarseApi::V1::AuthenticateUserSerializer

      def show
        respond_with current_user,
          serializer: SERIALIZER
      end
    end
  end
end
