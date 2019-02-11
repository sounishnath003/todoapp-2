class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :check_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo item has been deleted!."
    else
      flash[:error] = "Todo item cannot be deleted!."
    end
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.zone.now)
    redirect_to @todo_list, notice: "Todo Item has been finished."
  end

  private_methods
  def check_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
