class ProjectsSerializer
  include FastJsonapi::ObjectSerializer

  set_id :repository
  attributes :repository_projects
end
