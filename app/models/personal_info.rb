class PersonalInfo < ApplicationRecord
  enum gender: {male: 1, female: 2 }
  acts_as_favoritor
  
  ## Associations
  belongs_to :user

  def update_addresses addresses    
    if addresses.any?
      addresses.each do |address|
        add = Address.where(id: address[:id]).first_or_initialize
        add.update_attributes!(
          city:         address[:city], 
          state:        address[:state], 
          postal_code:  address[:postal_code], 
          country:      address[:country], 
          status:       address[:status])

        self.favorite(add)
      end
    end    
  end


end
