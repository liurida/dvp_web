class SearchController < ApplicationController
  def index
      @record = @q.result
  end

end
