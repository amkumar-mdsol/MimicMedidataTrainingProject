require "rails_helper"

describe Study, type: :model do
  context 'when study do not have a name' do
    it 'is invalid' do
      study = build(:study, name: '')

      expect(study.valid?).to eq false    
    end
  end

  context 'when study have a name' do
    let(:study) { create(:study) }

    it 'is valid' do
      expect(study.valid?).to eq true   
    end
  end

  context 'when age_limit is less than or equal to 7' do
    it 'is invalid' do
      study = build(:study, age_limit: 6)

      expect(study.valid?).to eq false      
    end

    context 'when equal to 7' do
      it 'is valid' do
        study = build(:study, age_limit: 7)

        expect(study.valid?).to eq false
      end
    end
  end

  context 'when age_limit is greater than 7' do
    it 'is valid' do
      study = build(:study, age_limit: 8)

      expect(study.valid?).to eq true
    end
  end

  context 'when phase is greater than 5' do
    it 'is invalid' do
      study = build(:study, phase: 7)

      expect(study.valid?).to eq false
    end
  end

  context 'when phase is lesser than 5' do
    it 'is valid' do
      study = build(:study, phase: 3)

      expect(study.valid?).to eq true
    end
  end

  context 'when drug is absent' do

    it 'is invalid' do
      study = build(:study, drug: '')

      expect(study.valid?).to eq false   
    end
  end

  context 'when drug is present' do
    let(:study) { build(:study, drug: 'anti-bio') }
    it 'is valid' do
      expect(study.valid?).to eq true
    end
  end

  describe '#scopes' do
    before do
      create_list(:study, 10, phase: 4)
      create_list(:study, 20, phase: 2)
    end

    context 'when we call usable_drugs' do
      it 'returns drugs with phase 4 or greater' do
        expect(Study.usable_drugs.count).to eq(10)
      end
    end

    context 'when we call under_trials' do
      it 'returns drugs under phase 4' do
        expect(Study.under_trials.count).to eq(20)
      end
    end
  end
end
