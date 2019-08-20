class Fact < ApplicationRecord
  validates :title, presence: true, length: {maxiumum: 140, minimum: 3 }
  validates :blurb, presence: true, length: {maxiumum: 14000, minimum: 20 }
  validates :category, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
