class Categorization < ActiveRecord::Base
  belongs_to :registrable, polymorphic: true
  belongs_to :category, foreign_key: "registrable_id"
  belongs_to :blog, foreign_key: "registrable_id"
end
