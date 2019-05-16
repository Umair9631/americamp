class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :home_phone
      t.string :mobile_phone
      t.string :email_address
      t.integer :status

      t.timestamps
    end
  end
end
