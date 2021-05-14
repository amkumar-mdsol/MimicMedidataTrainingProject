require 'rails_helper'

RSpec.describe Enrollment do

  describe '#create' do
    context 'when subject and study are valid' do
      let!(:enrollment) { create(:enrollment) }
      it 'creates a delayed job' do

        expect(DelayedJobs.count).to eq(1)
      end
    end

    context 'when either subject or study is invalid' do
      let(:subject) { create(:subject, blood_group: 'A+') }

      it 'not queues and jobs' do
        expect{ create(:enrollment, subject: subject) }.to raise_error
        expect(DelayedJobs.count).to eq(0)
      end
    end
  end
end
# stubbing and mocking