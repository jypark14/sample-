class InvestigationNote < ApplicationRecord
  belongs_to :investigation
  belongs_to :officer
end
