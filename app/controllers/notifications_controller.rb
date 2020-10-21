class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
  end

  def new
  end

  def create
  end
end
