class Building < ApplicationRecord
  has_many :stations
  validates :building, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :building_age, presence: true
  validates :rent, numericality:true

  accepts_nested_attributes_for :stations, reject_if: :all_blank, :allow_destroy => true


end
