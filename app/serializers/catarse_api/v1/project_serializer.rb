module CatarseApi
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :permalink, :name
    end
  end
end

