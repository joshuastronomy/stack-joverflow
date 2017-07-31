class QuestsController < ApplicationController

  def index
    @quests = Quest.page(params[:page]).per(5)
  end

  def show
    @quest = Quest.find(params[:id])
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to @quest
    else
      render 'new'
    end
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])
    if @quest.update(quest_params)
      redirect_to @quest
    else
      render 'edit'
    end

  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy!

    redirect_to quests_path
  end

  def quest_params
    params.require(:quest).permit(:title, :body)
  end
end
