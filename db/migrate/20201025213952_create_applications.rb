class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :email
      t.string :telephone
      t.string :address
      t.string :qualification
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
