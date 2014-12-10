module CatarseApi
  module V1
    class AuthenticateUserSerializer < ActiveModel::Serializer
      attributes :display_name,
        :email,
        :authentication_token
    end
  end
end
