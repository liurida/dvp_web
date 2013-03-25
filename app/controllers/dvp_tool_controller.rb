class DvpToolController < ApplicationController
  before_filter :set_ec_view, :only => ['show_dvp']

  # study/
  # show study dvp information
  def show_study
    @study = Study.find(params[:study_id])

  end

  # study/:study_id/dvp/
  def list_dvps
    @dvps = Study.find(params[:study_id]).dvps
  end

  # study/../dvp/1
  def show_dvp
    @dvp = Dvp.find(params[:dvp_id])
    @domain_list = @dvp.ec_items.select(:domain_id).where("domain_id is not null").uniq.map(&:domain)
    if !params[:domain].blank?
      domain_obj = Domain.find_by_name(params[:domain])
      @ecs = @dvp.ec_items.where(:domain_id => domain_obj.id )
    else
      @ecs = @dvp.ec_items
    end

    @ec_view = session[:ec_view].nil? ? session[:ec_view] : 'ctt'
  end

  # study/../dvp/1/ec/
  def list_ecs
    @ec_items = Dvp.find(params[:dvp_id]).ec_items
  end

  def show_ec
    @ec_item = EcItem.find(params[:ec_id])
  end

  private
  def set_ec_view
    if params[:ec_view]
      session[:ec_view] = params[:ec_view]
    elsif session[:ec_view].nil?
      session[:ec_view] = 'ctt'
    end
    p session[:ec_view]
  end
end
