class DvpToolController < ApplicationController
  before_filter :set_ec_view, :only => ['show_dvp']
  before_filter :get_dvp_and_domains, :except => ['show_study', 'new_dvp', 'create_dvp', 'comment_create']

  # /show_study/:study_id
  # show study dvp information
  def show_study
    @study = Study.find(params[:study_id])
    @study_member = @study.study_members.build
  end

  # /show_study/:study_id/new_dvp
  def new_dvp
    @study = Study.find(params[:study_id])
    @dvp = @study.dvps.new
  end

  # /show_study/:study_id/create_dvp
  def create_dvp
    @study = Study.find(params[:study_id])
    @dvp = @study.dvps.new(params[:dvp])
    if @dvp.save
      redirect_to show_study_path(@study)
    else
      render "new_dvp"
    end
  end


  # /list_dvp
  #def list_dvps
  #  @dvps = Study.find(params[:study_id]).dvps
  #end

  # /show_dvp/:dvp_id
  def show_dvp
    sub_ecs = @dvp.ec_items

    if session[:domain]
      domain_obj = Domain.find_by_name(session[:domain])
      @ecs = sub_ecs.where(:domain_id => domain_obj.id )
    else
      @ecs = sub_ecs
    end

    @ec_view = session[:ec_view].nil? ? session[:ec_view] : 'ctt'
  end

  # /show_dvp/:dvp_id/new_ec
  def new_ec
    domain_id = Domain.find_by_name(session[:domain]).id if session[:domain]
    @ec = @dvp.ec_items.build(:domain_id => domain_id)
  end

  # /show_dvp/:dvp_id/:ec_id/show_ec
  def show_ec
    @ec = EcItem.find(params[:ec_id])
  end

  #/show_dvp/:dvp_id/:ec_id/edit_ec
  def edit_ec
    @ec = EcItem.unscoped.find(params[:ec_id])
  end

  #show_dvp/:dvp_id/:ec_id/update_ec
  def update_ec
    @ec_item = EcItem.unscoped.find(params[:ec_id])
    p params[:ec_item]

    respond_to do |format|
      if @ec_item.update_attributes(params[:ec_item])
        format.html { redirect_to show_dvp_path(@dvp), notice: 'Ec item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_ec" }
        format.json { render json: @ec_item.errors, status: :unprocessable_entity }
      end
    end

  end

  #show_dvp/:dvp_id/:ec_id/destroy_ec
  def destroy_ec
    @ec_item = EcItem.find(params[:ec_id])
    #@ec_item.destroy

    #soft delete
    respond_to do |format|
      if @ec_item.update_attributes(:removed => 'y')
        format.html { redirect_to show_dvp_path(@dvp), notice: 'Ec item was successfully removed' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_ec" }
        format.json { render json: @ec_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # /show_dvp/:dvp_id/create_ec
  def create_ec
    @ec = @dvp.ec_items.new(params[:ec_item])

    if @ec.save
      redirect_to show_dvp_path(@dvp)
    else
      render 'new_ec'
    end
  end
  # /list_ec
  def list_ecs
    @ec_items = Dvp.find(params[:dvp_id]).ec_items
  end

  # create_comments

  def comment_create
    commentable = EcItem.find(params[:ec_id])
    if !params[:comment].blank?
      record = commentable.comments.create
      record.comment = comment_hight(params[:comment])
      record.user_id = params[:user_id]
      record.save
      message = 'Comment added'
    else
      message =  'No comment'
    end
    redirect_to params[:return_url], :notice => message
  end

  def comment_hight(str)
    str = str.gsub('ctom',"<span class='label label-info'>ctom</span>")
    str = str.gsub('cda',"<span class='label label-important'>cda</span>")
    str = str.gsub('tester',"<span class='label label-warning'>tester</span>")
  end

  private
  def set_ec_view
    if params[:ec_view]
      session[:ec_view] = params[:ec_view]
    elsif session[:ec_view].nil?
      session[:ec_view] = 'ctt'
    end
    if params[:domain_name] == 'all'
      session[:domain] = nil
    elsif params[:domain_name]
      session[:domain] =  params[:domain_name]
    end
    p session[:domain]
  end

  def get_dvp_and_domains
    @dvp = Dvp.find(params[:dvp_id])
    @domain_list = @dvp.ec_items.select(:domain_id).where("domain_id is not null").uniq.map(&:domain)
  end

 end
