module CatarseApi
  module V1
    class ContributionSerializer < ActiveModel::Serializer

      attributes :id,
        :name,
        :anonymous,
        :value,
        :reward_id


      def name
        return user.display_name if current_user_is_owner?

        unless object.anonymous?
          user.display_name
        end
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



