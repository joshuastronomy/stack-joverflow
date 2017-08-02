class AnswersController < ApplicationController

before_action :authorize, only: [:new, :create, :edit, :update, :destroy]
before_action :my_answer, only: [:edit, :update, :destroy]



  def index

  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.quest = Quest.find(params[:quest_id])

    if @answer.save
      flash[:success] = 'Your answer is online!'
      redirect_to Quest.find(params[:quest_id])
    else
      render 'new'
    end

  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:quest_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to @quest
    else
      render 'edit'
    end

  end

  def destroy
    @quest = Quest.find(params[:quest_id])
    @answer = Answer.find(params[:id])
    @answer.destroy!

    redirect_to @quest
  end

private

def toggle_accepted
@answer = Answer.find(params[:id])
  @answer.toggle!(:accepted)
  if @answer.accepted
    flash[:success] = "Yes"
  else
    flash[:warning] = "no"
  end
  redirect_to @answer.query
end


  def answer_params
    params.require(:answer).permit(:body, :user_id, :quest_id)
  end

end
