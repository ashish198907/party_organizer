class AdminController < ApplicationController
  def index
  end

  def user_notification
  end

  def send_notification
    if params[:notify_users] == "all"
      notify_emails = User.all.map{|a| a.email}.uniq.join(',')
    else
      notify_emails = @current_event.users.map{|a| a.email}.uniq.join(',') if @current_event.present?
    end
    if notify_emails.present?
      UserMailer.deliver_notify_all(params[:subject],notify_emails,params[:content])
      redirect_to admin_user_notification_path, :notice => 'Notification sent to all registered users.'
    else
      flash[:error] = 'Notification not sent. No user Found.'
      redirect_to admin_user_notification_path
    end
  end

  def manage_event_users
    @event_users = Event.find(params[:id]).users
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    render :json => true
  end

end
