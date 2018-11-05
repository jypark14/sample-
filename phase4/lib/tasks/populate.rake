require 'faker' 
require 'factory_bot_rails'

namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Step 0: initial set-up
    # Drop the old db and recreate from scratch
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate to set up db structure based on latest migrations
    Rake::Task['db:migrate'].invoke
    
    # Get the faker gem (see docs at http://faker.rubyforge.org/rdoc/)
    # require 'faker' 
    # require 'factory_bot_rails'

    ### Step 1: Create crimes
    murder1  = FactoryBot.create(:crime, name: "Murder, First Degree")
    murder2  = FactoryBot.create(:crime, name: "Murder, Second Degree")
    manslt   = FactoryBot.create(:crime, name: "Manslaughter")
    manslt2  = FactoryBot.create(:crime, name: "Manslaughter, Second Degree", active: false)
    arson    = FactoryBot.create(:crime, name: "Arson")
    robbery  = FactoryBot.create(:crime, name: "Armed Robbery")
    assault  = FactoryBot.create(:crime, name: "Assault")
    battery  = FactoryBot.create(:crime, name: "Battery")
    kidnap   = FactoryBot.create(:crime, name: "Kidnapping")
    traf     = FactoryBot.create(:crime, name: "Drug Trafficking")
    possess  = FactoryBot.create(:crime, name: "Drug Possession")
    trespass = FactoryBot.create(:crime, name: "Trespass", felony: false)
    ptheft   = FactoryBot.create(:crime, name: "Petty Theft", felony: false)
    d_peace  = FactoryBot.create(:crime, name: "Disturbing the Peace", felony: false)
    vandal   = FactoryBot.create(:crime, name: "Vandalism", felony: false)

    felonies     = Crime.felonies.active.alphabetical.to_a
    misdemeanors = Crime.misdemeanors.active.alphabetical.to_a
    puts "Created felony & misdemeanor crimes"


    ### STEP 2: Create units
    major_crimes   = FactoryBot.create(:unit)
    headquarters   = FactoryBot.create(:unit, name: "Headquarters")
    homicide       = FactoryBot.create(:unit, name: "Homicide")
    forensics      = FactoryBot.create(:unit, name: "Forensics")
    coroner        = FactoryBot.create(:unit, name: "Coroner")
    narcotics      = FactoryBot.create(:unit, name: "Narcotics")
    patrol         = FactoryBot.create(:unit, name: "Patrol")
    swat           = FactoryBot.create(:unit, name: "S.W.A.T.", active: false)  # became quick response team...
    quick_response = FactoryBot.create(:unit, name: "Quick Response Team")
    puts "Created police units"

    ### STEP 3: Create officers and users
    # At HQ
    jgordon  = FactoryBot.create(:officer, first_name: "Jim", last_name: "Gordon", rank: "Commissioner", unit: headquarters, ssn: "064-23-0511")
    gloeb    = FactoryBot.create(:officer, first_name: "Gillian", last_name: "Loeb", rank: "Commissioner", unit: headquarters, active: false)
    sxue     = FactoryBot.create(:officer, first_name: "Stacey", last_name: "Xue", rank: "Officer", unit: headquarters)
    nfields  = FactoryBot.create(:officer, first_name: "Nora", last_name: "Fields", rank: "Captain", unit: coroner)
    makins   = FactoryBot.create(:officer, first_name: "Michael", last_name: "Akins", rank: "Captain", unit: forensics)
    mbarra   = FactoryBot.create(:officer, first_name: "Mac", last_name: "Barra", rank: "Officer", unit: forensics)
    fdiaz    = FactoryBot.create(:officer, first_name: "Flora", last_name: "Diaz", rank: "Officer", unit: forensics)
    puts "Created HQ & related officers"

    # Major Crimes
    msawyer   = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", unit: major_crimes)
    sessen    = FactoryBot.create(:officer, first_name: "Sarah", last_name: "Essen", rank: "Captain", unit: major_crimes, active: false)
    dcornwell = FactoryBot.create(:officer, first_name: "David", last_name: "Cornwell", rank: "Lieutenant", unit: major_crimes)
    jblake    = FactoryBot.create(:officer, unit: major_crimes)
    jazeveda  = FactoryBot.create(:officer, first_name: "Josh", last_name: "Azeveda", rank: "Detective", unit: major_crimes)
    jbartlett = FactoryBot.create(:officer, first_name: "Jane", last_name: "Bartlett", rank: "Detective", unit: major_crimes)
    hbullock  = FactoryBot.create(:officer, first_name: "Harvey", last_name: "Bullock", rank: "Detective", unit: major_crimes)
    tburke    = FactoryBot.create(:officer, first_name: "Thomas", last_name: "Burke", rank: "Detective", unit: major_crimes)
    rchandler = FactoryBot.create(:officer, first_name: "Romy", last_name: "Chandler", rank: "Detective", unit: major_crimes)
    ecohen    = FactoryBot.create(:officer, first_name: "Eric", last_name: "Cohen", rank: "Detective", unit: major_crimes)
    jdavies   = FactoryBot.create(:officer, first_name: "Jackson", last_name: "Davies", rank: "Detective Sergeant", unit: major_crimes)
    ncrowe    = FactoryBot.create(:officer, first_name: "Nelson", last_name: "Crowe", rank: "Detective", unit: major_crimes)
    varrazzio = FactoryBot.create(:officer, first_name: "Vincent", last_name: "Arrazzio", rank: "Detective Sergeant", unit: major_crimes)
    mc_officers = [dcornwell,jblake,jazeveda,jbartlett,hbullock,tburke,rchandler,ecohen,jdavies,ncrowe,varrazzio]
    puts "Created Major Crimes officers"

    # Homicide
    calvarez  = FactoryBot.create(:officer, first_name: "Carlos", last_name: "Alvarez", rank: "Detective", unit: homicide)
    jbard     = FactoryBot.create(:officer, first_name: "Jason", last_name: "Bard", rank: "Detective", unit: homicide)
    bbilbao   = FactoryBot.create(:officer, first_name: "Brian", last_name: "Bilbao", rank: "Lieutenant", unit: homicide)
    ghennelly = FactoryBot.create(:officer, first_name: "Gerrard", last_name: "Hennelly", rank: "Captain", unit: homicide)
    dpeak     = FactoryBot.create(:officer, first_name: "Donald", last_name: "Peak", rank: "Officer", unit: homicide)
    rmulcahey = FactoryBot.create(:officer, first_name: "Rebecca", last_name: "Mulcahey", rank: "Officer", unit: homicide)
    homicide_officers = [calvarez,jbard,bbilbao,dpeak,rmulcahey]
    puts "Created Homicide officers"

    # Patrol
    cmason  = FactoryBot.create(:officer, first_name: "Catherine", last_name: "Mason", rank: "Captain", unit: patrol)
    50.times do
      create_officer_and_user(patrol)
    end
    puts "Created Patrol officers"

    # Narcotics
    ddelaware  = FactoryBot.create(:officer, first_name: "Derek", last_name: "Mason", rank: "Captain", unit: narcotics)
    12.times do
      create_officer_and_user(narcotics)
    end
    puts "Created Narcotics officers"

    # Quick Response Team
    jcolby  = FactoryBot.create(:officer, first_name: "James", last_name: "Colby", rank: "Captain", unit: quick_response)
    24.times do
      create_officer_and_user(quick_response)
    end
    puts "Created Quick Response Team officers"

    ### STEP 4: Create the Rogues Gallery


    ### STEP 5 (for now, create the rest of the testing context)
    lacey     = FactoryBot.create(:investigation, crime: murder1)
    pussyfoot = FactoryBot.create(:investigation, title: "Pussyfoot Heist", crime: robbery, description: "Theft of $1.2 million in rare jewels.", crime_location: "2809 West 20th Street", date_opened: 20.months.ago.to_date, date_closed: 18.months.ago.to_date, solved: true, batman_involved: true)
    harbor    = FactoryBot.create(:investigation, title: "Great Gotham Harbor Arson", crime: arson, description: "The burning of the Gotham Harbor. Over $24 million in property damage done.", crime_location: "Gotham Harbor", date_opened: 2.months.ago.to_date, date_closed: nil)
      
    lacey_jblake      = FactoryBot.create(:assignment, investigation: lacey, officer: jblake)
    # because you can't assign people to closed investigations
    pussyfoot.date_closed = nil
    pussyfoot.save
    pussyfoot_jblake  = FactoryBot.create(:assignment, investigation: pussyfoot, officer: jblake, start_date: 20.months.ago.to_date, end_date: 18.months.ago.to_date)
    pussyfoot_msawyer = FactoryBot.create(:assignment, investigation: pussyfoot, officer: msawyer, start_date: 19.months.ago.to_date, end_date: 18.months.ago.to_date)
    # now reset the close date
    pussyfoot.date_closed = 18.months.ago.to_date
    pussyfoot.save
    harbor_jazeveda   = FactoryBot.create(:assignment, investigation: harbor, officer: jazeveda, start_date: 2.months.ago.to_date)   

    20.times do
      days_back = (3..100).to_a.sample
      street_address = Faker::Address.street_name
      investigator = homicide_officers.sample
      murder1_investigation = FactoryBot.create(:investigation, title: "Murder at #{street_address}", crime: murder1, description: "A brutal premediated murder at #{street_address}.", crime_location: street_address, date_opened: days_back.days.ago.to_date, date_closed: nil, solved: false, batman_involved: false)
      officer_assignment = FactoryBot.create(:assignment, investigation: murder1_investigation, officer: investigator)
    end
    
    10.times do
      days_back = (1..60).to_a.sample
      street_address = Faker::Address.street_name
      investigator = homicide_officers.sample
      murder2_investigation = FactoryBot.create(:investigation, title: "Murder at #{street_address}", crime: murder2, description: "A murder of passion committed at #{street_address}.", crime_location: street_address, date_opened: days_back.days.ago.to_date, date_closed: nil, solved: false, batman_involved: false)
      officer_assignment = FactoryBot.create(:assignment, investigation: murder2_investigation, officer: investigator)
    end
    
    25.times do
      days_back = (3..120).to_a.sample
      street_address = Faker::Address.street_name
      investigator = mc_officers.sample
      this_crime = felonies.sample
      this_investigation = FactoryBot.create(:investigation, title: "Crime at #{street_address}", crime: this_crime, description: "A terrible #{this_crime.name.downcase} committed at #{street_address}.", crime_location: street_address, date_opened: days_back.days.ago.to_date, date_closed: nil, solved: false, batman_involved: true)
      officer_assignment = FactoryBot.create(:assignment, investigation: this_investigation, officer: investigator)
    end
    
    
    puts "Created some investigations, etc."
  end
end

def create_officer_and_user(unit)
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  this_officer  = FactoryBot.create(:officer, first_name: first_name, last_name: last_name, rank: "Officer", unit: unit)
end

