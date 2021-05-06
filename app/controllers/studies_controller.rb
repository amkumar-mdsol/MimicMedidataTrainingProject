class StudiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    # before_action :verify_authenticity_token

    # after_action :demo_after_action, only: [:index]
    around_action :demo_around_action

    def create
        @study = Study.new(study_params)
        
        if @study.save
            render json: { notice: "Study created successfully!!"}
        else
            render json: { error: "Could not create study!!"}
        end
    end

    def index
        puts "Index method called..."
        @studies = Study.all

        render json: @studies
    end

    def update
        @study = Study.find(params[:id])
    
        if @study.update(study_params)
            render json: { notice: "Study updated successfuly!!"}
        else
            render json: { error: "Could not find study!!"}
        end
    end

    private

    def demo_around_action
        p "This is at the beggining...."
        yield
        p "this is after action call"
    end

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :study_group_id)
    end
end

#CRUD -- create read update destroy