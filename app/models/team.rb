class Team < ApplicationRecord
  has_many :users, inverse_of: :team

  validates :name, presence: true

  scope :default_team, -> { where(id: 4).last }

end
