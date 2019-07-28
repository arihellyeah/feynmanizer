class FactsController < ApplicationController
  def index
    @fact = Fact.order("RANDOM()").first
  end

  def new
    @fact = Fact.new
  end

  def create
    @fact = Fact.create(fact_params)
    if @fact.invalid?
      flash[:error] = 'The data you entered is <em>invalid</em>'
    end
    redirect_to root_path
  end

  private

  def fact_params
    params.require(:fact).permit(:title, :blurb, :category)
  end

end
