# override the default sort parameters for resources

require Rails.root.join('app/controllers/resources_controller')

class ResourcesController < ApplicationController

  def index
    params["sort"] ||= "identifier asc"
    @search_data = Search.for_type(session[:repo_id], params[:include_components]==="true" ? ["resource", "archival_object"] : "resource", params_for_backend_search.merge({"facet[]" => SearchResultData.RESOURCE_FACETS}))
  end

end