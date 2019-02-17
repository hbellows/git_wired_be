class RepositorySerializer
  include FastJsonapi::ObjectSerializer
  
  set_id :login
  attributes :repositories
end
