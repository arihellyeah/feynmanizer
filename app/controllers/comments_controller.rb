class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @fact = Fact.find(params[:fact_id])
    @fact.comments.create(comment_params.merge(user: current_user))
    redirect_to fact_path(@fact)

  end

  def comment_params
    params.require(:comment).permit(:message)
  end

end
