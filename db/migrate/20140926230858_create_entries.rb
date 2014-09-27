class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :title
    	t.date :date
    	t.string :location
    	t.text :body
    	
      t.timestamps
    end
  end
end
