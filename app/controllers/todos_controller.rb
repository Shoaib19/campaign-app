class TodosController < ApplicationController
    before_action :get_campaign
    before_action :get_todo, only:[:show,:edit,:update,:destroy]   
    
    def index
    end    
    
    def new
        @todo = @campaign.todo.new
    end

    def create
        @todo = @campaign.todo.new(todo_params)
        if  @todo.save
            redirect_to user_campaign_tab_path(current_user.id,@todo.campaign_tab_id)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if  @todo.update(todo_params)
            redirect_to user_campaign_tab_path(current_user.id,@todo.campaign_tab_id)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @todo.destroy
        redirect_to user_campaign_tab_path(current_user.id,@todo.campaign_tab_id)
    end
 private

    def get_campaign
        @campaign = CampaignTab.find(params[:campaign_tab_id])
    end

    def get_todo
        @todo = @campaign.todo.find(params[:id])
    end

    def todo_params
        params.require(:todo).permit(:title, :campaign_tab_id, :user_id)
    end
end
