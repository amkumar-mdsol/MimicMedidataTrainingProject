class StudyGroupsController < ApplicationController

  def index
  	@study_groups = StudyGroup.all
  	render json: @study_groups
  end
end