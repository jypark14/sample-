class CrimeInvestigation < ApplicationRecord
  belongs_to :crime
  belongs_to :investigation
end
