module CatarseApi
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :permalink, :name, :_links

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

