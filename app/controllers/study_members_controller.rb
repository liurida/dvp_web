class StudyMembersController < ApplicationController
  # GET /study_members
  # GET /study_members.json
  def index
    @study_members = StudyMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @study_members }
    end
  end

  # GET /study_members/1
  # GET /study_members/1.json
  def show
    @study_member = StudyMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study_member }
    end
  end

  # GET /study_members/new
  # GET /study_members/new.json
  def new
    @study_member = StudyMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study_member }
    end
  end

  # GET /study_members/1/edit
  def edit
    @study_member = StudyMember.find(params[:id])
  end

  # POST /study_members
  # POST /study_members.json
  def create
    @study_member = StudyMember.new(params[:study_member])
    if @study_member.save
      if params[:next_url]
        redirect_to params[:next_url], notice: "Study member added"
      else
        redirect_to @study_member,  notice: "Study member added"
      end
    else
      if params[:next_url]
        redirect_to params[:next_url], error: "Failed adding study member"
      else
        redirect_to @study_member,  notice: "Study member added"
      end

    end
    #respond_to do |format|
    #  if @study_member.save
    #    format.html { redirect_to @study_member, notice: 'Study member was successfully created.' }
    #    format.json { render json: @study_member, status: :created, location: @study_member }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @study_member.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PUT /study_members/1
  # PUT /study_members/1.json
  def update
    @study_member = StudyMember.find(params[:id])

    respond_to do |format|
      if @study_member.update_attributes(params[:study_member])
        format.html { redirect_to @study_member, notice: 'Study member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @study_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_members/1
  # DELETE /study_members/1.json
  def destroy
    @study_member = StudyMember.find(params[:id])
    @study_member.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
