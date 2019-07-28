class FactsController < ApplicationController
  def index
    @fact = Fact.order("RANDOM()").first
  end

  def new
    @fact = Fact.new
  end
end
