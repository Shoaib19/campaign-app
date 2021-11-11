class CampaignTabsController < ApplicationController
    before_action :get_campaign, only:[:show, :edit, :update, :destroy ]
    
    def index
    end 
    
    def new
        @campaign_tab = CampaignTab.new
    end

    def create
        @campaign_tab = CampaignTab.new(campaign_tab_params)
        if @campaign_tab.save
            redirect_to user_campaign_tab_path(current_user,@campaign_tab)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @campaign_tab.update(campaign_tab_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @campaign_tab.destroy
        redirect_to root_path
    end

private

    def get_campaign
        @campaign_tab = CampaignTab.find(params[:id])
    end
    

    def campaign_tab_params
        params.require(:campaign_tab).permit(:title, :purpose, :estimated_duration,:user_id)
    end

end
