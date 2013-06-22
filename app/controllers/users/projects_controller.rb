class ProjectsController < ApplicationController

  def create
    @project = Project.create({category_name: params[:category_name], zipcode: params[:zipcode]})
    render none: true
  end

end
