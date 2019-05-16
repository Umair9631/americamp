class PersonalInfo < ApplicationRecord
  enum gender: {male: 1, female: 2 }
  acts_as_favoritor
  
  ## Associations
  belongs_to :user
end
