class Pokemon < ApplicationRecord
  validates :number, :name, :type_1, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, presence: true
  validates :legendary, inclusion: { in: [true, false] }
  validates :name, uniqueness: true
end
