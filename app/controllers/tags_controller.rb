class TagsController < ApplicationController
    before_action :get_campaign
    before_action :get_tag, only:[:destroy]   
    
    def index
    end

    def new
        @tag = @campaign.tags.new
    end

    def create
        @tag = @campaign.tags.new(tag_params)
        if @tag.save
            redirect_to user_campaign_tab_path(current_user.id,@tag.campaign_tab_id)
        else
            render 'new'
        end
    end

    def destroy
        @tag.destroy
        redirect_to user_campaign_tab_path(current_user.id,@tag.campaign_tab_id)
    end
 private
    def get_campaign
        @campaign = CampaignTab.find(params[:campaign_tab_id])
    end

    def get_tag
     @tag = @campaign.tags.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name, :campaign_tab_id, :user_id)
    end
end
