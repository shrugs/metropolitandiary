class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author, :permalink, :date_published, :photo
end
