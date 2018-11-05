# require needed files
require './test/sets/crimes'
require './test/sets/units'
require './test/sets/officers'
require './test/sets/investigations'
require './test/sets/assignments'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Crimes
  include Contexts::Units
  include Contexts::Officers
  include Contexts::Investigations
  include Contexts::Assignments

  # a build_all method to quickly create a full testing context
  def build_all
    create_crimes
    create_units
    create_officers
    create_investigations
    create_assignments
  end

  # a destroy_all method to quickly destroy the testing context
  def destroy_all
    destroy_assignments
    destroy_investigations
    destroy_officers
    destroy_units
    destroy_crimes
  end
end