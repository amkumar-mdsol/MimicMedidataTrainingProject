class StudiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @study = Study.new(study_params)

        if @study.save
            render json: { notice: "Study created successfully!!"}
        else
            render json: { error: "Could not create study!!"}
        end
    end

    private

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :study_group_id)
    end
end

#CRUD -- create read update destroy