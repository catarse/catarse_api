module CatarseApi
  module V1
    class ContributionSerializer < ActiveModel::Serializer

      attributes :id,
        :name,
        :anonymous,
        :value,
        :reward_id,
        :email,
        :address_street,
        :address_number,
        :address_neighbourhood,
        :address_zip_code,
        :address_city,
        :address_state,
        :address_complement,
        :phone_number,
        :user_id,
        :confirmed_at,
        :platform_fee,
        :payer_email,
        :payment_method,
        :cpf


      def platform_fee
        return object.value * CatarseSettings[:catarse_fee].to_f if current_user_is_owner?
      end

      def payment_method
        return object.payment_method if current_user_is_owner?
      end

      def payer_email
        return object.payer_email if current_user_is_owner?
      end

      def name
        return user.display_name if current_user_is_owner?

        unless object.anonymous?
          user.display_name
        end
      end

      def user_id
        return object.user_id if current_user_is_owner?

        unless object.anonymous?
          object.user_id
        end
      end

      def address_state
        object.address_state || user.address_state if current_user_is_owner?
      end

      def address_complement
        object.address_complement || user.address_complement if current_user_is_owner?
      end

      def address_city
        object.address_city || user.address_city if current_user_is_owner?
      end

      def cpf
        object.payer_document || user.cpf if current_user_is_owner?
      end

      def phone_number
        object.address_phone_number || user.phone_number if current_user_is_owner?
      end

      def address_zip_code
        object.address_zip_code || user.address_zip_code if current_user_is_owner?
      end

      def address_number
        object.address_number || user.address_number if current_user_is_owner?
      end

      def address_neighbourhood
        object.address_neighbourhood || user.address_neighbourhood if current_user_is_owner?
      end

      def address_street
        object.address_street || user.address_street if current_user_is_owner?
      end

      def email
        user.email if current_user_is_owner?
      end

      def value
        object.value if current_user_is_owner?
      end

      def reward_id
        object.reward_id if current_user_is_owner?
      end

      protected

      def user
        object.user
      end

      def parent
        object.project
      end

      def current_user_is_owner?
        current_user.admin? || (current_user.id == parent.user_id)
      end
    end
  end
end



