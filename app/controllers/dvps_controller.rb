class DvpsController < ApplicationController
  # GET /dvps
  # GET /dvps.json
  def index
    @dvps = Dvp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dvps }
    end
  end

  # GET /dvps/1
  # GET /dvps/1.json
  def show
    @dvp = Dvp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dvp }
    end
  end

  # GET /dvps/new
  # GET /dvps/new.json
  def new
    @dvp = Dvp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dvp }
    end
  end

  # GET /dvps/1/edit
  def edit
    @dvp = Dvp.find(params[:id])
  end

  # POST /dvps
  # POST /dvps.json
  def create
    @dvp = Dvp.new(params[:dvp])

    respond_to do |format|
      if @dvp.save
        format.html { redirect_to @dvp, notice: 'Dvp was successfully created.' }
        format.json { render json: @dvp, status: :created, location: @dvp }
      else
        format.html { render action: "new" }
        format.json { render json: @dvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dvps/1
  # PUT /dvps/1.json
  def update
    @dvp = Dvp.find(params[:id])

    respond_to do |format|
      if @dvp.update_attributes(params[:dvp])
        format.html { redirect_to @dvp, notice: 'Dvp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dvps/1
  # DELETE /dvps/1.json
  def destroy
    @dvp = Dvp.find(params[:id])
    @dvp.destroy

    respond_to do |format|
      format.html { redirect_to dvps_url }
      format.json { head :no_content }
    end
  end

  # batch_create ec /dvps/1/batch_ec
  def batch_ec

  end
  # copy action
  def ec_copy
    p 'in ec_copy'
    p params[:dvp_id]
    @dvp = Dvp.find(params[:id])
    @source_ec = Dvp.find(params[:dvp_id]).ec_items

    copy_ec_from(params[:dvp_id])

    redirect_to ec_items_path

  end

  def copy_ec_from(dvp_id)
    source_ec = Dvp.find(dvp_id).ec_items
    source_ec.each do |item|
      values = item.attributes.except("id", "created_at","updated_at","dvp_id","study_id")
      record = @dvp.ec_items.build(values)
      record.save()
    end
  end
end



