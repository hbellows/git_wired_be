class ColumnFinder

  def initialize(user, project)
    @user = user
    @project = project
  end

  def project 
    @project.title
  end

  def columns
    project_columns_data.map do |data|
      @project.columns.find_or_create_by(status: data[:name])
    end
  end

  def column_cards
    project_columns_data.each_with_object([]) do |column, data|
      hash = {}
      hash[:column_name] = column[:name] 
      hash[:cards] = column_cards_data(column[:id]).map {|card| card[:id] }
      data << hash
    end
  end

  private

  def github_service
    @github_service ||= GithubService.new(@user.token)
  end

  def project_columns_data
    github_service.find_project_columns(@project.github_id)
  end

  def column_cards_data(column_id)
    github_service.find_column_cards(column_id)
  end

  # def card_data
  #   github_service.find_card(card_id)
  # end
end