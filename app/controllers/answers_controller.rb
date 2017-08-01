class AnswersController < ApplicationController

before_action :authorize, only: [:new, :create, :edit, :update, :destroy]


  def index

  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.quest = Quest.find(params[:q_id])

    if @answer.save
      redirect_to Quest.find(params[:q_id])
    else
      render 'new'
    end

  end

  def edit

  end

  def update
  end

  def destroy
  end

  def answer_params
    params.require(:answer).permit(:body, :user_id, :quest_id)
  end

end
