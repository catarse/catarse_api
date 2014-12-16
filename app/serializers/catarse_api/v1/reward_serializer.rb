module CatarseApi
  module V1
    class RewardSerializer < ActiveModel::Serializer
      attributes :id,
        :minimum_value,
        :description,
        :maximum_contributions,
        :deliver_estimate,
        :deliver_at,
        :sold_out?,
        :remaining

      def deliver_estimate
        object.display_deliver_estimate
      end
    end
  end
end


