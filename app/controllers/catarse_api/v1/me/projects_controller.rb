module CatarseApi
  module V1::Me
    class ProjectsController < CatarseApi::ApplicationController
      SERIALIZER = CatarseApi::V1::ProjectSerializer
      has_scope :with_state

      def index
        respond_with collection,
          each_serializer: SERIALIZER
      end

      protected

      def collection
        @projects ||= apply_scopes(current_user.projects)
      end

    end
  end
end
