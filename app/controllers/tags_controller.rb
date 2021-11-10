class TagsController < ApplicationController
 before_action :get_tag, only:[:destroy]   
    
    def index
    end

    def new
        @id = params[:id]
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            redirect_to campaign_tab_path(@tag.campaign_tab_id)
        else
            render 'new'
        end
    end

    def destroy
        @tag.destroy
        redirect_to campaign_tab_path(@tag.campaign_tab_id)
    end
 private

    def get_tag
     @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name, :campaign_tab_id, :user_id)
    end
end
