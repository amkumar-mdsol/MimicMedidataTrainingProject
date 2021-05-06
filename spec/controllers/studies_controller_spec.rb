require 'rails_helper'
require 'spec_helper'

RSpec.describe StudiesController do
    describe '#create' do
        context 'when study created successfuly' do
            before do
                @sg = StudyGroup.create(name: 'study_group1')
            end

            let(:study_parameters) do
                {
                    name: 'abc',
                    age_limit: 30,
                    drug: 'pqr',
                    phase: 0,
                    study_group_id: @sg.id
                }
            end

            it 'returns success message' do
                post :create, params: { study: study_parameters }
                expect(response.status).to eq(200)
                expect(response.body).to eq ("{\"notice\":\"Study created successfully!!\"}")
            end
        end

        context 'when study did not create' do
            
            let(:study_parameters) do
                {
                    name: 'abc',
                    age_limit: 30,
                    drug: 'pqr',
                    phase: 0,
                    study_group_id: 1
                }
            end

            it 'returns success message' do
                post :create, params: { study: study_parameters }
    
                expect(response.status).to eq(200)
                expect(response.body).to eq ("{\"error\":\"Could not create study!!\"}")
            end
        end


    end
end