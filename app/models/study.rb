# Study model
class Study < ApplicationRecord

  validates :name, :drug, presence: true
  validates :age_limit, numericality: { greater_than: 7 }
  validates :phase, numericality: { less_than: 5 }
end


# model name is singular, and the relation name pertaining to it in the database
# is plural.
