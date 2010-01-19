class LevelsController < ApplicationController
  before_filter :ensure_user  
  
  # GET /levels
  # GET /levels.xml
  def index
    @levels = Level.all.sort{|a,b| a.number <=> b.number}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @levels }
    end
  end

  # GET /levels/1
  # GET /levels/1.xml
  def show
    @level = Level.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @level }
    end
  end

  # GET /levels/new
  # GET /levels/new.xml
  def new
    @level = Level.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @level }
    end
  end

  # GET /levels/1/edit
  def edit
    @level = Level.find(params[:id])
  end

  # POST /levels
  # POST /levels.xml
  def create
    @level = Level.new(params[:level])

    respond_to do |format|
      if @level.save
        flash[:notice] = 'Level was successfully created.'
        format.html { redirect_to(@level) }
        format.xml  { render :xml => @level, :status => :created, :location => @level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /levels/1
  # PUT /levels/1.xml
  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        flash[:notice] = 'Level was successfully updated.'
        format.html { redirect_to(@level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.xml
  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.html { redirect_to(levels_url) }
      format.xml  { head :ok }
    end
  end
end
