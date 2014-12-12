class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :title
    	t.date :date
    	t.string :location
      t.string :people
      t.string :url
    	t.text :body
    	
      t.timestamps
    end
  end
end
