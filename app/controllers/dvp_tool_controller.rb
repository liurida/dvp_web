class DvpToolController < ApplicationController

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
  end

  # study/../dvp/1/ec/
  def list_ecs
    @ec_items = Dvp.find(params[:dvp_id]).ec_items
  end

  def show_ec
    @ec_item = EcItem.find(params[:ec_id])
  end
end
