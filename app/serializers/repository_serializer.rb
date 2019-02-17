class RepositorySerializer
  include FastJsonapi::ObjectSerializer
  
  set_id :github_handle
  attributes :repositories
end
