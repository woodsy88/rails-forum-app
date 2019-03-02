class ForumThreads::ForumPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread

  def create
    @forum_post = @forum_thread.forum_posts.new forum_post_params
    @forum_post.user = current_user

    if @forum_post.save
      # @forum_post.send_notifications!
                  # after creation, redirect to the post_id

                  #create an array of unique items (no duplicate users), and minus the currrent user, then loop over it create a notification for each user 
       (@forum_thread.users.uniq - [current_user]).each do |user|
         Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @forum_post ) 
       end

      redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Successfully posted!"
    else
      redirect_to @forum_thread, alert: "Unable to save your post"
    end
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:forum_thread_id])
    end

    def forum_post_params
      params.require(:forum_post).permit(:body)
    end
end