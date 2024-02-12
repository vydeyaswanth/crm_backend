class Customer < ApplicationRecord
    has_many :contacts
    has_many :interactions

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
