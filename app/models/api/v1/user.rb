class Api::V1::User < ApplicationRecord

  has_many :tokens, dependent: :destroy

end
