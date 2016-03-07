class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author, :permalink, :date_published
  has_one :photo
end
