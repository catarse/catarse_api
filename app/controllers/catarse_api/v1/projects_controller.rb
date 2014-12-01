module CatarseApi
  module V1
    class ProjectsController < CatarseApi::ApplicationController
      SERIALIZER = CatarseApi::V1::ProjectSerializer

      def show
        respond_with resource,
          serializer: SERIALIZER
      end

      protected

      def resource
        @project ||= Project.find params[:id]
      end
    end
  end
end
