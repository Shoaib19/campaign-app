class TodosController < ApplicationController
before_action :get_todo, only:[:show,:edit,:update,:destroy]   
    
    def index
    end    
    
    def new
        @id = params[:id]
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if  @todo.save
            redirect_to  campaign_tab_path(@todo.campaign_tab_id)
        else
            render 'new'
        end
    end

    def edit
        todo_id = params[:id]
        @id = Todo.find(todo_id).campaign_tab_id
    end

    def update
        if  @todo.update(todo_params)
            redirect_to campaign_tab_path(@todo.campaign_tab_id)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @todo.destroy
        redirect_to campaign_tab_path(@todo.campaign_tab_id)
    end
 private

    def get_todo
        @todo = Todo.find(params[:id])
    end

    def todo_params
        params.require(:todo).permit(:title, :campaign_tab_id, :user_id)
    end
end
