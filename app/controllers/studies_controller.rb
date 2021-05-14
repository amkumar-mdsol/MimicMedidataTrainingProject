class StudiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @study = Study.new(study_params)
        if @study.save
            redirect_to studies_path
        else
            render :new
        end
    end

    def index
        puts "Index method called..."
        @studies = Study.all

        @studies123 = Study.all
        # render json: @studies
    end

    def new
        @study ||= Study.new
    end

    def show
    end

    def edit
    end

    def update
        @study = Study.find(params[:id])
    
        if @study.update(study_params)
            render json: { notice: "Study updated successfuly!!"}
        else
            render json: { error: "Could not find study!!"}
        end
    end

    def active
    end

    private

    def demo_around_action
        p "This is at the beggining...."
        yield
        p "this is after action call"
    end

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :study_group_id, :symptoms, :my_image)
    end
end
