class CreateEducationalBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :educational_backgrounds do |t|
      t.boolean :is_fulltime_student
      t.string :university_name
      t.string :course_title
      t.string :mnth_yr_began_studies
      t.string :graduation_mnth_yr
      t.date :summer_holiday_from
      t.date :summer_holiday_to
      t.string :background
      t.integer :user_id

      t.timestamps
    end
  end
end
