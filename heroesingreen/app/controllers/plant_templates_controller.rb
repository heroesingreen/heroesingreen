class PlantTemplatesController < ApplicationController
  before_filter :ensure_user
  
  # GET /plant_templates
  # GET /plant_templates.xml
  def index
    @plant_templates = PlantTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plant_templates }
    end
  end

  # GET /plant_templates/1
  # GET /plant_templates/1.xml
  def show
    @plant_template = PlantTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plant_template }
    end
  end

  # GET /plant_templates/new
  # GET /plant_templates/new.xml
  def new
    @plant_template = PlantTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plant_template }
    end
  end

  # GET /plant_templates/1/edit
  def edit
    @plant_template = PlantTemplate.find(params[:id])
  end

  # POST /plant_templates
  # POST /plant_templates.xml
  def create
    @plant_template = PlantTemplate.new(params[:plant_template])

    respond_to do |format|
      if @plant_template.save
        flash[:notice] = 'PlantTemplate was successfully created.'
        format.html { redirect_to(@plant_template) }
        format.xml  { render :xml => @plant_template, :status => :created, :location => @plant_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plant_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plant_templates/1
  # PUT /plant_templates/1.xml
  def update
    @plant_template = PlantTemplate.find(params[:id])

    respond_to do |format|
      if @plant_template.update_attributes(params[:plant_template])
        flash[:notice] = 'PlantTemplate was successfully updated.'
        format.html { redirect_to(@plant_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plant_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plant_templates/1
  # DELETE /plant_templates/1.xml
  def destroy
    @plant_template = PlantTemplate.find(params[:id])
    @plant_template.destroy

    respond_to do |format|
      format.html { redirect_to(plant_templates_url) }
      format.xml  { head :ok }
    end
  end
end
