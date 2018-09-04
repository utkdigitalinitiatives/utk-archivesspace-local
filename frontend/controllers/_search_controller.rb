# override the default sorting for searches
require Rails.root.join('app/controllers/search_controller')

class SearchController < ApplicationController

  def do_search
    params["sort"] ||= "identifier asc"
    @search_data = Search.all(session[:repo_id], params_for_backend_search.merge({"facets[]" => SearchResultData.BASE_FACETS}))
  end
end