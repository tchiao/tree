class CreateTestEntries < ActiveRecord::Migration
  def change
    create_table :test_entries do |t|
      t.text :content
      t.string :article_type
      t.integer :actual_month
      t.integer :actual_day
      t.integer :actual_year
      t.string :actual_title
      t.string :actual_location

      t.timestamps
    end
  end
end
