class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_one :signup
end
