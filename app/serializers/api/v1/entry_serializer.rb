class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :author, :permalink, :date_published, :lat_f, :lng_f, :radius_f
  has_one :photo
end
