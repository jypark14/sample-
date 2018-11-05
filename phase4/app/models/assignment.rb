class Assignment < ApplicationRecord

  # Relationships
  belongs_to :investigation
  belongs_to :officer

  # Scopes
  scope :current, -> { where(end_date: nil) }
  scope :past, -> { where.not(end_date: nil) }
  scope :chronological, -> { order(:start_date) }
  scope :by_officer, -> { joins(:officer).order('officers.last_name, officers.first_name') }
  
  # Validations
  validates_presence_of :officer_id, :investigation_id, :start_date
  validates_date :start_date, on_or_before: -> { Date.current }
  validates_date :end_date, on_or_after: :start_date, allow_blank: true
  validate :assigned_officer_is_active
  validate :is_an_open_investigation, on: :create
  validate :assignment_is_not_a_duplicate, on: :create


  private
  def assigned_officer_is_active
    all_officers_ids = Officer.active.all.map{|u| u.id}
    unless all_officers_ids.include?(self.officer_id)
      errors.add(:officer, "is not an active officer in GCPD")
    end
  end

  def assignment_is_not_a_duplicate
    if assignment_exists? 
      errors.add(:investigation_id, "this assignment already exists.")
    end
  end

  def assignment_exists?
    !Assignment.where(investigation_id: self.investigation_id, officer_id: self.officer_id).current.empty?
  end

  def is_an_open_investigation
    # This method tests to see an investigation is open or not and gives error if not
    return true if self.investigation.nil?
    current_open = Investigation.select{|a| a.date_closed.nil?}
    unless current_open.include?(self.investigation)
      self.errors.add(:investigation, "is not currently an open investigation")
    end
  end
    
end
