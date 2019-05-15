class PersonalInfo < ApplicationRecord
  enum gender: [:male, :female]
  
  ## Associations
  belongs_to :user
end
