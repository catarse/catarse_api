module CatarseApi
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :permalink, :name, :_links, :total_contributions

      def total_contributions
        object.contributions.avaiable_to_count
      end

      def _links
        {
          self: project_url(object),
          rewards: project_rewards_url(object),
          contributions: project_contributions_url(object)
        }
      end
    end
  end
end

