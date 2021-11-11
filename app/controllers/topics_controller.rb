class TopicsController < ApplicationController
    before_action :get_campaign
    before_action :get_topic, only:[:show,:edit, :destroy, :update]
   
    def index
    end
    
  def new
        #finding topics if current user created any
        topics = Topic.all
            topics.each do |t|
                #if current user created topic for current
                #campaign user then show error page
            if t.user_id == current_user.id
                found_expert = CampaignTab.find(t.campaign_tab_id).user_id
                if found_expert != nil && found_expert == @campaign.user_id
                    render "error"
                end
            end
        end
        @topic = @campaign.topics.new
    end

    def create
        @topic = @campaign.topics.new(topic_params)
        if @topic.save
            redirect_to user_campaign_tab_topic_path(current_user.id,@campaign, @topic)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @topic.update(topic_params)
            redirect_to user_campaign_tab_topic_path(current_user.id,@campaign, @topic)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @topic.destroy
        redirect_to user_campaign_tab_path(current_user.id,@topic.campaign_tab_id)
    end

 private
    
    def get_campaign
        @campaign = CampaignTab.find(params[:campaign_tab_id])
    end

    def get_topic
        @topic = @campaign.topics.find(params[:id])
    end 

    def topic_params
        params.require(:topic).permit(:title, :user_id, :campaign_tab_id)
    end
end
