class WardSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :DOB, :gender, :height, :weight
end
