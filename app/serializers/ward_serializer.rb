class WardSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :date_of_birth, :gender, :height, :weight, :avatar_url
end
