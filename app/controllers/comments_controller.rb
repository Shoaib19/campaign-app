class CommentsController < ApplicationController
 before_action :get_comment, only:[:show, :edit, :update, :destroy]  
 before_action :get_campaign
 before_action :get_topic
    def index
    end

    def new
    if @topic.present?
      @comment = @topic.comments.new
    else
      @comment = @campaign.comments.new
    end
    end

    def create
      if @topic.present?
        @comment = @topic.comments.new(comment_params)
        if @comment.save
          redirect_to  user_campaign_tab_topic_path(current_user.id,@campaign, @topic)
      else
          render 'new'
      end
      else
        @comment = @campaign.comments.new(comment_params)
        if @comment.save
          redirect_to user_campaign_tab_path(current_user.id,@comment.commented_on_id)
      else
          render 'new'
      end
      end
       
    end
    
    def edit 
    end

    def update
        if @comment.update(comment_params)
          if @topic.present?
            redirect_to user_campaign_tab_topic_comment_path(current_user.id,@campaign,@topic,@comment.id)
          else
            redirect_to user_campaign_tab_comment_path(current_user.id,@campaign,@comment.id)
          end    
        else
            render 'edit'
        end
    end

    def show 
    end
    
    def destroy
        c = @comment
        @comment.destroy
        if c.commented_on_type == "Topic"
            redirect_to user_campaign_tab_topic_path(current_user.id,@campaign,@topic)
        elsif c.commented_on_type == "CampaignTab"
            redirect_to user_campaign_tab_path(current_user.id,@campaign.id)
        end
    end

private

    def get_campaign
      @campaign = CampaignTab.find(params[:campaign_tab_id])
    end

    def get_topic
      if request.url.to_s.include? "topics"
      @topic = Topic.find(params[:topic_id])
      end
    end



  def get_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :user_id)
  end
end
