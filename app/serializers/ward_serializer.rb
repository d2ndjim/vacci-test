class WardSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :DOB, :gender, :height, :weight
  has_one :user
end
