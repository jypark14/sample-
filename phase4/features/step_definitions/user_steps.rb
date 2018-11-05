require './test/contexts'
include Contexts

Given /^an initial setup$/ do
  # context used for phase 3 only
  create_crimes
  create_units
  create_officers
  create_investigations
  create_assignments
  # change one date to known date
  @lacey.date_opened = "2018-09-23"
  @lacey.save
end

Given /^no setup yet$/ do
  # assumes initial setup already run as background
  destroy_assignments
  destroy_investigations
  destroy_officers
  destroy_units
  destroy_crimes
end