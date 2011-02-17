class ActivitiesController < ApplicationController

  before_filter :authenticate_user!

 
  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = Activity.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])
    @project = Project.find(params[:project_id])
    @activity.user = current_user 
    @activity.project = @project
    
    if(@activity.project.has_activity_for_user_and_date(current_user, @activity.date))
      @activity.errors.add(:date, 'user already has an activity recorded for this date')
      respond_to do |format|
        format.html { render :action => "new" }
      end
      return
    end
    
    respond_to do |format|
      if @activity.save
        format.html { redirect_to(@project, :notice => 'Activity was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
    
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])
       
    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(@activity.project, :notice => 'Activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    targetProject = @activity.project    
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(targetProject, :notice => 'Activity deleted') }
      format.xml  { head :ok }
    end
  end
  
end
