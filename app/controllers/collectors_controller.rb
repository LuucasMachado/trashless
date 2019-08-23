class CollectorsController < ApplicationController
  def new
    @collector = Collector.new
  end

end