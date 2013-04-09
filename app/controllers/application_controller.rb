class ApplicationController < ActionController::Base
  before_filter :search_q

  def search_q
    @q = Study.search(params[:q])
  end

end
