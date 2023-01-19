class ImmunizationSerializer < ActiveModel::Serializer
  attributes :id, :w6, :w10, :w14, :m6, :m9, :m12, :m15
  has_one :ward
end
