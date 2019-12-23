class FactsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    #facts.where(category: params[:category])
    @facts = if params[:category] == "coding"
      Fact.where(category: "coding")
    elsif params[:category] == "science"
      Fact.where(category: "science")
    elsif params[:category] == "other"
      Fact.where(category: "other")
    else
      @fact = Fact.all.order("created_at DESC").paginate(page: params[:page], per_page:5)
    end
    #@fact = Fact.order("RANDOM()").first
  end

  def new
    @fact = Fact.new
  end

  def create
    #@fact = Fact.new(params)
      #if @object.save
      #  redir
      #else
      #render new (
    @fact = current_user.facts.create(fact_params)

    hash = DictionaryService.new
    escaped_title = URI.escape(@fact.title)
    @fact.definition = hash.def_from_api(escaped_title)
    @fact.save

    if @fact.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def about
  end

  def show
    @fact = Fact.find_by_id(params[:id])
    @comment = Comment.new
    if @fact.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def edit
    @fact = Fact.find(params[:id])
    if @fact.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @fact = Fact.find(params[:id])
    if @fact.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @fact.update_attributes(fact_params)
    redirect_to root_path
  end

  def destroy
    @fact = Fact.find(params[:id])
    if @fact.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @fact.destroy
    redirect_to root_path
  end


  private

  def fact_params
    params.require(:fact).permit(:title, :blurb, :category, :definition)
  end
end
