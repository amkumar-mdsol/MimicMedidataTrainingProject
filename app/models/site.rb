class Site < ApplicationRecord
  #belongs_to :study
 has_one :address,  as: :addressable
end



