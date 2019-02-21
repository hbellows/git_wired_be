class WireframesSerializer
  include FastJsonapi::ObjectSerializer

  set_id :repository
  attributes :wireframes
end
