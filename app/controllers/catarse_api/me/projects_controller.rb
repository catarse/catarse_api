module CatarseApi
  module Me
    class ProjectsController < CatarseApi::ApplicationController
      SERIALIZER = CatarseApi::V1::ProjectSerializer

      helper_method :collection
      helper_method :resource

      def index
        respond_with collection,
          each_serializer: SERIALIZER
      end

      def show
        render json: resource,
          serializer: SERIALIZER
      end

      def collection
        @projects ||= current_user.projects
      end

      def resource
        @project ||= collection.find params[:id]
      end
    end
  end
end
