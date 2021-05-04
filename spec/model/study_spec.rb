require "rails_helper"
# study should have a name

describe Study, type: :model do
  context 'when study do not have a name' do
    it 'is invalid' do
      study = Study.new(name: '')

      expect(study.valid?).to eq false    
    end
  end

  context 'when study have a name' do
    it 'is valid' do
      study = Study.new(name: 'my_study')

      expect(study.valid?).to eq true   
    end
  end
end