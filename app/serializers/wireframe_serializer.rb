class WireframeSerializer
  include FastJsonapi::ObjectSerializer

  set_id :repository
  attributes :wireframe
end
