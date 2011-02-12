class ActivitiesController < ApplicationController

  before_filter :authenticate_user!

  # GET /activities
  # GET /activities.xml
  def index
    @activities = current_user.activities.sort_by {|a| a.date}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

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
    @activity.user = current_user

    sum_percent = @activity.project.leaving_percent_by_user_and_activity(current_user, @activity.date)
      
    if sum_percent + @activity.day_percent > 100
      @activity.errors.add(:day_percent, "will be greater than 100. Maximum authorized : #{100-sum_percent}")
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
      return
    end
     
    
    respond_to do |format|
      if @activity.save
        format.html { redirect_to(@activity, :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    sum_percent = @activity.project.leaving_percent_by_user_and_activity(current_user, @activity.date)
    new_day_percent = Integer(params[:activity]["day_percent"])
      
      
      
    if sum_percent - @activity.day_percent + new_day_percent > 100
      @activity.errors.add(:day_percent, "will be greater than 100. Maximum authorized : #{100-sum_percent+@activity.day_percent}")
      respond_to do |format|
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
      return
    end
    
    
    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(@activity, :notice => 'Activity was successfully updated.') }
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
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
  
end
