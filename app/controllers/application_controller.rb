class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

def authorize
  redirect_to '/login' unless current_user
end

def my_quest
  quest = Quest.find(params[:q_id])
  redirect_to '/quests' unless quest.user_id == current_user.id
end

# def my_answer
#   answer = Answer.find()
#   redirect =
# end

end
