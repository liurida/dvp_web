class SearchController < ApplicationController
  def index

    if !params[:q]['name_cont'].blank?
      @record = @q.result
    else
      redirect_to :back, :alert => 'You need input something at least to search'
    end
  end

end
