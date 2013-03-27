class EcItemsController < ApplicationController
  # GET /ec_items
  # GET /ec_items.json
  def index
    @ec_items = EcItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ec_items }
    end
  end

  # GET /ec_items/1
  # GET /ec_items/1.json
  def show
    @ec_item = EcItem.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ec_item }
    end
  end

  # GET /ec_items/new
  # GET /ec_items/new.json
  def new
    @ec_item = EcItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ec_item }
    end
  end

  # GET /ec_items/1/edit
  def edit
    @ec_item = EcItem.find(params[:id])
  end

  # POST /ec_items
  # POST /ec_items.json
  def create
    @ec_item = EcItem.new(params[:ec_item])

    respond_to do |format|
      if @ec_item.save
        format.html { redirect_to @ec_item, notice: 'Ec item was successfully created.' }
        format.json { render json: @ec_item, status: :created, location: @ec_item }
      else
        format.html { render action: "new" }
        format.json { render json: @ec_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ec_items/1
  # PUT /ec_items/1.json
  def update
    @ec_item = EcItem.find(params[:id])

    respond_to do |format|
      if @ec_item.update_attributes(params[:ec_item])
        format.html { redirect_to @ec_item, notice: 'Ec item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ec_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ec_items/1
  # DELETE /ec_items/1.json
  def destroy
    @ec_item = EcItem.find(params[:id])
    @ec_item.destroy

    respond_to do |format|
      format.html { redirect_to ec_items_url }
      format.json { head :no_content }
    end
  end


end
