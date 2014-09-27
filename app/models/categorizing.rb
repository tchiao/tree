class Categorizing < ActiveRecord::Base
  belongs_to :category
  belongs_to :entry
end
