class Customer < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :interactions, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
