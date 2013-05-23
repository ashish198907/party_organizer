class UsersController < ApplicationController
  
  def welcome
    render :layout => "welcome"
  end 

  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all, :conditions => {:event_id => @current_event.id},:order => "created_at DESC", :limit => 10) if @current_event.present?

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  #def show
  #  @user = User.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @user }
  #  end
  #end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = @current_event.users.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit_user
    @user = User.find(params[:id])
    if @user.id != cookies[:editable_user].to_i
      flash[:error] = "Error"
      redirect_to home_url
    end
  end


  def verify
    @user = User.find(params[:id])
    if @user.pass_code == params[:passcode]
      cookies[:editable_user] = { :value => @user.id, :expires => 10.minutes.from_now }
      #session[:editable_user] = @user.id
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = @current_event.users.new(params[:user])
    respond_to do |format|
      if @user.save
        UserMailer.deliver_welcome(@user,@current_event)
        format.html {redirect_to(home_url,:notice=>"You have successfully registered for the party.")}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(home_url, :notice => 'You have successfully updated your details.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show_feed_back_form

  end

  def submit_feed_back_form
    UserMailer.deliver_feedback(params[:sender],params[:subject],params[:content])
    respond_to do |format|
      format.html { redirect_to(home_url, :notice => 'Your suggestion/feedback has been successfully submitted.') }
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  #def destroy
  #  @user = User.find(params[:id])
  #  @user.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to(users_url) }
  #    format.xml  { head :ok }
  #  end
  #end

end
