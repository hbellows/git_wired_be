class RepositorySerializer
  include FastJsonapi::ObjectSerializer
  
  set_id :login
  attributes :repos
end
