class ImmunizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :vaccination_type, :vaccination_date
end
