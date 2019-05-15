class CreatePersonalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_infos do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nationality
      t.date :dob
      t.integer :gender
      t.string :city_of_birth
      t.string :country_of_birth
      t.date :earliest_date_available
      t.date :last_date_available
      t.boolean :driving_license
      t.string :skype
      t.string :phone_no
      t.string :mobile_no
      t.integer :user_id

      t.timestamps
    end
  end
end
