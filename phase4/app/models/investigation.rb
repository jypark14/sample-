class Investigation < ApplicationRecord

  # Relationships
  belongs_to :crime
  has_many :assignments
  has_many :officers, through: :assignments
  has_many :crimes, through: :crime_investigations 
  has_many :crime_investigations
  has_many :criminals, through: :suspects 
  has_many :suspects
  has_many :investigation_notes 


  # Scopes
  scope :is_open, -> { where(date_closed: nil) }
  scope :is_closed, -> { where.not(date_closed: nil) }
  scope :open_on_date,  ->(date){ where("date_opened <= ? AND (date_closed > ? OR date_closed IS NULL)", date, date) }
  scope :with_batman,   -> { where(batman_involved: true) }
  scope :was_solved,    -> { where(solved: true) }
  scope :unsolved,    -> { where.not(solved: true) }
  scope :chronological, -> { order(:date_opened) }
  scope :alphabetical,  -> { order(:title) }

  # Validations
  validates_presence_of :title, :crime_id, :date_opened
  validates_date :date_opened, on_or_before: -> { Date.current }
  validates_date :date_closed, on_or_after: :date_opened, allow_blank: true
  validate :crime_exists_and_is_active  ### FOR PHASE 2 ONLY 

  # Callback - cleanup after investigation closed
  after_update :remove_assignments_from_closed_investigations

  private
  def remove_assignments_from_closed_investigations
    return true if self.date_closed.nil? || self.assignments.current.empty?
    self.assignments.current.each do |assignment|
      assignment.end_date = self.date_closed
      assignment.save
    end
  end

  def crime_exists_and_is_active
    all_crime_ids = Crime.active.all.map{|c| c.id}
    unless all_crime_ids.include?(self.crime_id)
      errors.add(:crime, "is not an active crime in GCPD")
    end
  end

end
