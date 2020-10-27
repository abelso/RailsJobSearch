class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :name
      t.string :email
      t.string :category
      t.date :deadline

      t.timestamps
    end
  end
end
