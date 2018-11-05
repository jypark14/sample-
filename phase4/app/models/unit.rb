class Unit < ApplicationRecord

  # Relationships
  has_many :officers

  # Scopes
  scope :alphabetical, -> { order('name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where.not(active: true) }
  
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Other methods
  def number_of_active_officers
    self.officers.active.count
  end


end
