class Api::V1::EntrySerializer < ActiveModel::Serializer
  attributes :id, :id, :title, :content, :author, :permalink, :date_published
end
