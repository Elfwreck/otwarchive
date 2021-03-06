class SearchController < ApplicationController

  def index
    @languages = Language.all(:order => :short)
    @query = {}
    if params[:query]
      @query = Query.standardize(params[:query])
      unless @query == params[:query]
        params[:query] = @query
        redirect_to url_for(params)
      end
    end
  end  

  
end
