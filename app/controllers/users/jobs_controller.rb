class JobsController < ApplicationController

  def create
    @job = Job.create({category_name: params[:category_name], zipcode: params[:zipcode]})
    render none: true
  end

end
