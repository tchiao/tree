class AddEndDateToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :end_date, :date
  end
end
