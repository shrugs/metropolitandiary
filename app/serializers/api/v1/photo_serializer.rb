class PhotoSerializer < ActiveModel::Serializer
  attributes :url, :caption, :attribution
end
