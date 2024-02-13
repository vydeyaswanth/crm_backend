class Interaction < ApplicationRecord
  belongs_to :customer

  validates :title, presence: true
  validates :details, presence: true
  validates :date, presence: true
end
