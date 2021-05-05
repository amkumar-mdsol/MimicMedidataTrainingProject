require "rails_helper"
# study should have a name

describe Study, type: :model do
  context 'when study do not have a name' do
    it 'is invalid' do
      study = Study.new(name: '', age_limit: 8, phase: 3, drug: 'anti-biotic')

      expect(study.valid?).to eq false    
    end
  end

  context 'when study have a name' do
    it 'is valid' do
      study = Study.new(name: 'my_study', age_limit: 8, phase: 3, drug: 'anti-biotic')

      expect(study.valid?).to eq true   
    end
  end

  context 'when age_limit is less than or equal to 7' do
    it 'is invalid' do
      study = Study.new(name: 'my_study', age_limit: 6, phase: 3, drug: 'anti-biotic')

      expect(study.valid?).to eq false      
    end

    context 'when equal to 7' do
      it 'is valid' do
        study = Study.new(name: 'my_study', age_limit: 7, phase: 3, drug: 'anti-biotic')

        expect(study.valid?).to eq false
      end
    end
  end

  context 'when age_limit is greater than 7' do
    it 'is valid' do
      study = Study.new(name: 'my_study', age_limit: 8, phase: 3, drug: 'anti-biotic')

      expect(study.valid?).to eq true
    end
  end

  context 'when phase is greater than 5' do
    it 'is invalid' do
      study = Study.new(name: 'my_study', age_limit: 8, phase: 7, drug: 'anti-biotic')

      expect(study.valid?).to eq false
    end
  end

  context 'when phase is lesser than 5' do
    it 'is valid' do
      study = Study.new(name: 'my_study', age_limit: 8, phase: 3, drug: 'anti-biotic')

      expect(study.valid?).to eq true
    end
  end

  context 'when drug is absent' do
    it 'is invalid' do
      study = Study.new(name: 'my_study', age_limit: 8, phase: 3, drug: '')

      expect(study.valid?).to eq false   
    end
  end

  context 'when drug is present' do
    it 'is valid' do
      study = Study.new(name: 'my_study', age_limit: 8, phase: 3, drug: 'anti-biotic')

      expect(study.valid?).to eq true
    end
  end  
end