class Task < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  enum status: { incomplete: 0, complete: 1 } # For Task status management
end
