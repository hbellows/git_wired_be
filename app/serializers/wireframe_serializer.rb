class WireframeSerializer
  include FastJsonapi::ObjectSerializer

  set_id :id
  attributes :id, :name, :object, :created_at, :updated_at
end
