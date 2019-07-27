class FactsController < ApplicationController
  def index
    @fact = Fact.order("RANDOM()").first
  end
end
