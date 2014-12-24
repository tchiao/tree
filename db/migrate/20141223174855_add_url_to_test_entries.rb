class AddUrlToTestEntries < ActiveRecord::Migration
  def change
    add_column :test_entries, :url, :string
  end
end
