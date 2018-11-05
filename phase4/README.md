GCPD Tracker System 
===
This is the starter code for Phase 4 of the Gotham City Police Department Tracker System.  This project was assigned in the fall of 2018 as a 67-272 project at Carnegie Mellon University, Information Systems department.  More information about the project can be found at [67272.cmuis.net](https://67272.cmuis.net).

Populating the dev db with test contexts
---
Using the populate script isn't too valuable this phase as we are only dealing with models and testing the models.  You can load your current testing context into the dev database by doing the following:

1. Drop the existing dev database
2. Remigrate so all new migrations included
3. Open rails console and put in the following:
  - `require 'factory_bot_rails'`
  - `require './test/contexts'`
  - `include Contexts`
  - `build_all` or whatever create methods you want to run


Notes on tests
---
There is 100% test coverage for existing models and helpers.  However, there are significant changes to some of the existing models, so tests should be updated so that coverage remains at 100%.


Cloning this repo
---
After cloning this repo to your , switch into the project directory and remove the reference to `origin` with the following:

```
  git remote rm origin
```

This will stop you from accidentally trying to push changes to Prof. H's repo (which won't be accepted).  Now it is recommended that instead you set up a connection to your remote repository on darkknight soon and begin saving your code there early in your development.  There is no limit on the number of times you can commit code to the remote repository and remember that committing to your local repository does not automatically mean the remote repository has been updated.


