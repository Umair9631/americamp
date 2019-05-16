class CreateJobReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :job_references do |t|
      t.text :why_work_at_camp
      t.text :positive_impact_at_camp
      t.text :why_camp_hire_you
      t.boolean :at_day_camp
      t.boolean :at_residential_camp
      t.boolean :with_female_campers
      t.boolean :with_male_campers
      t.boolean :with_family_groups
      t.boolean :with_children
      t.boolean :with_no_running_water
      t.boolean :with_no_electricity
      t.boolean :camp_with_platform_tent
      t.string :campers_with_special_needs
      t.string :interested_with_active_faith_based_program
      t.text :type_of_faith_based_camp
      t.boolean :affiliated_to_ymca_org
      t.integer :user_id

      t.timestamps
    end
  end
end
