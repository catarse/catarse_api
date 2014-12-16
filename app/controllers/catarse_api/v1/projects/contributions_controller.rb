module CatarseApi
  module V1
    module Projects
      class ContributionsController < CatarseApi::ApplicationController
        SERIALIZER = CatarseApi::V1::ContributionSerializer

        serialization_scope :current_user

        def index
          respond_with collection.page(params[:page]).per(200),
            each_serializer: SERIALIZER
        end

        protected

        def parent
          @project ||= Project.find params[:project_id]
        end

        def collection
          @contributions ||= parent.contributions.with_state('confirmed')
        end
      end
    end
  end
end
