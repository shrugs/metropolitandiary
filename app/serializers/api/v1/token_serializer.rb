class TokenSerializer < ActiveModel::Serializer
  attributes :token

  def token
    object.contents
  end
end
