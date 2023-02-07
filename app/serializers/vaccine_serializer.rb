class VaccineSerializer < ActiveModel::Serializer
  attributes :id, :name, :vaccination_type, :vaccination_date, :completed
end
