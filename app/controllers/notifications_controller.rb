class NotificationsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery :except => [:mark_as_read]


  def index
                                                                # custom scope in notifications model
    @notifications = Notification.where(recipient: current_user).unread
  end


  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

end