class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :endorsed
end
