# override the default sorting for accessions
require Rails.root.join('app/controllers/accessions_controller')

class AccessionsController < ApplicationController

  def index
  params["sort"] ||= "identifier asc"
  @search_data = Search.for_type(session[:repo_id], "accession", params_for_backend_search.merge({"facet[]" => SearchResultData.ACCESSION_FACETS}))
  end
end