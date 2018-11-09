class Officer < ApplicationRecord

  # Relationships
  belongs_to :unit
  belongs_to :user 
  has_many :assignments
  has_many :investigations_notes 

  has_many :investigations, through: :assignments

  # Scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where.not(active: true) }
  scope :for_unit, -> (unit_id){ where(unit_id: unit_id) }
  scope :detectives, -> { where('rank LIKE ?', "%detective%") }
  
  # Validations
  validates_presence_of :first_name, :last_name, :unit_id, :ssn
  validates_format_of :ssn, with: /\A\d{3}[- ]?\d{2}[- ]?\d{4}\z/, message: "should be 9 digits and delimited with dashes only"
  validates_uniqueness_of :ssn
  validates_inclusion_of :rank, in: %w[Officer Sergeant Detective Detective\ Sergeant Lieutenant Captain Commissioner], message: "is not an option"
  validate :unit_is_active_at_gcpd

  # Other methods and callbacks
  before_save :reformat_ssn
  before_save :remove_assignments_from_inactive_officer

  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
  
  def current_assignments
    current = self.assignments.select{|a| a.end_date.nil?}
    return nil if current.empty?
    current
  end

  RANKS_LIST = [['Officer', 'Officer'],['Sergeant', 'Sergeant'],['Detective', 'Detective'],['Detective Sergeant', 'Detective Sergeant'],['Lieutenant', 'Lieutenant'],['Captain', 'Captain'],['Commissioner', 'Commissioner']]

  private
  def reformat_ssn
    ssn = self.ssn.to_s      # change to string in case input as all numbers 
    ssn.gsub!(/[^0-9]/,"")   # strip all non-digits
    self.ssn = ssn           # reset self.ssn to new string
  end

  def unit_is_active_at_gcpd
    all_units_ids = Unit.active.all.map{|u| u.id}
    unless all_units_ids.include?(self.unit_id)
      errors.add(:unit, "is not an active unit in GCPD")
    end
  end

  def remove_assignments_from_inactive_officer
    return true if self.active 
    self.assignments.current.each do |assignment|
      assignment.end_date = Date.current
      assignment.save
    end
  end
end
