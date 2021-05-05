class Subject < ApplicationRecord
	has_one :address,  as: :addressable
	has_and_belongs_to_many :studies
end
