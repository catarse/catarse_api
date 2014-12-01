module CatarseApi
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :permalink, :name, :_links

      def _links
        {
          self: project_url(object)
        }
      end
    end
  end
end

