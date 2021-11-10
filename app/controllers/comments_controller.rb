class CommentsController < ApplicationController
 before_action :get_comment, only:[:show, :edit, :update, :destroy]  
 
    def index
    end
    @@record = 0
    def new
    item = params[:item]
    @model_name = params[:from_model]
    if @model_name == "topic"
      @rec = Topic.find(item)
      @@record = @rec
      @comment = @rec.comments.new
    elsif @model_name == "campaign"
      @rec = CampaignTab.find(item)
      @@record = @rec
      @comment = @rec.comments.new
    end
    end

    def create
        @comment = @@record.comments.new(comment_params)
        @@record = 0
        path = path_name(@comment)
        if @comment.save
            redirect_to path
        else
            render 'new'
        end
    end
    
    def edit 
    end

    def update
        if @comment.update(comment_params)
            path = path_name(@comment)
            redirect_to path
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
            redirect_to topic_path(c.commented_on_id)
        elsif c.commented_on_type == "CampaignTab"
            redirect_to campaign_tab_path(c.commented_on_id)
        end
    end

private
  def path_name(comment)
    if comment.commented_on_type == "Topic"
      return topic_path(@comment.commented_on_id)
    elsif comment.commented_on_type == "CampaignTab"
      return campaign_tab_path(@comment.commented_on_id)
    end
  end

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :user_id)
  end
end
