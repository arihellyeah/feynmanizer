class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @fact = Fact.find(params[:fact_id])
    @fact.comments.create(comment_params.merge(user: current_user))
    redirect_to fact_path(@fact)
  end

  def edit
    @comment = Comment.find(params[:id])
    #@fact.comments.create(comment_params.merge(user: current_user))
    if @comment.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params.to_h)
    redirect_to fact_path(@comment.fact)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @comment.destroy
    redirect_to fact_path(@comment.fact)
  end

  private

  def comment_params
    params.require(:comment).permit!
  end

end
