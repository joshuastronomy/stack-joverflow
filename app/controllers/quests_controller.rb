class QuestsController < ApplicationController

before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
before_action :my_quest, only: [:edit, :update, :destroy]


  def index
    @quests = Quest.page(params[:page]).per(5)
  end

  def show
    @quest = Quest.find(params[:id])
    @answers = Answer.where(quest_id: @quest.id)
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user = current_user

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

private

  def quest_params
    params.require(:quest).permit(:title, :body, :user_id)
  end
end
