# override the default sorting for accessions
require Rails.root.join('app/controllers/accessions_controller')

class AccessionsController < ApplicationController


    def index
      params["sort"] ||= "identifier asc"
      params_for_backend_search["fl"] ||= "id,uri,four_part_id,title,identifier,accession_date,finding_aid_status,fullrecord"
      respond_to do |format|
        format.html {
          @search_data = Search.for_type(session[:repo_id], "accession", params_for_backend_search.merge({"facet[]" => SearchResultData.ACCESSION_FACETS}))
          format.csv {
            search_params = params_for_backend_search.merge({"facet[]" => SearchResultData.ACCESSION_FACETS})
            search_params["type[]"] = "accession"
            uri = "/repositories/#{session[:repo_id]}/search"
            csv_response( uri, search_params )
          }
        }
      end
    end

end