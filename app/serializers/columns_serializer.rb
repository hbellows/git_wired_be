class ColumnsSerializer
  include FastJsonapi::ObjectSerializer

  set_id :project
  attributes :column_cards
end
