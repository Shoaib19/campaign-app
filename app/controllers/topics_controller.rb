class TopicsController < ApplicationController
before_action :get_topic, only:[:show,:edit, :destroy, :update]
   
    def index
    end
    
  def new
        #getting campaign info
        campaign = CampaignTab.find(params[:id])
        @id = campaign.id
        expert_user = campaign.user_id

        #finding topics if current user created any
        topics = Topic.all
            topics.each do |t|
                #if current user created topic for current
                #campaign user then show error page
            if t.user_id == current_user.id
                found_expert = CampaignTab.find(t.campaign_tab_id).user_id
                if found_expert != nil && found_expert == expert_user
                    render "error"
                end
            end
        end
        @topic = Topic.new
    end

    def create
        @idd 
        @topic = Topic.new(topic_params)
        if @topic.save
            redirect_to @topic
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @topic.update(topic_params)
            redirect_to @topic
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @topic.destroy
        redirect_to campaign_tab_path(@topic.campaign_tab_id)
    end

 private

    def get_topic
        @topic = Topic.find(params[:id])
    end 

    def topic_params
        params.require(:topic).permit(:title, :user_id, :campaign_tab_id)
    end
end
