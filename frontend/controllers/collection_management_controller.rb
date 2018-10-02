class CollectionManagementController < ApplicationController

  set_access_control  "view_repository" => [:index]


  def index
    facets = ["parent_type", "processing_priority", "processing_status"]

    @search_data = Search.for_type(session[:repo_id], "collection_management", params_for_backend_search.merge({"facet[]" => facets, "fl" => "id,uri,four_part_id,title,identifier,accession_date,finding_aid_status,fullrecord"}))
  end

end
