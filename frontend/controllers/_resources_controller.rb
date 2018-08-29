# override the default sort parameters for resources

require Rails.root.join('app/controllers/resources_controller')

class ResourcesController < ApplicationController

  DEFAULT_RES_INDEX_OPTS = {
      'resolve[]' => ['repository:id', 'resource:id@compact_resource', 'top_container_uri_u_sstr:id'],
      'sort' => 'identifier asc',
      'facet.mincount' => 1
  }

end