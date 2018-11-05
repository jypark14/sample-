class Crime < ApplicationRecord

  # Relationships
  has_many :investigations

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where.not(active: true) }
  scope :felonies, -> { where(felony: true) }
  scope :misdemeanors, -> { where.not(felony: true) }

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
