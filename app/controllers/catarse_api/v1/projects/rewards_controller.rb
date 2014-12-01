module CatarseApi
  module V1
    module Projects
      class RewardsController < CatarseApi::ApplicationController
        SERIALIZER = CatarseApi::V1::RewardSerializer

        def index
          respond_with collection,
            each_serializer: SERIALIZER
        end

        protected

        def parent
          @project ||= Project.find params[:project_id]
        end

        def collection
          @rewards ||= parent.rewards
        end
      end
    end
  end
end
