class Organization < ApplicationRecord
  has_and_belongs_to_many :clients
  has_many :hardwares
end
