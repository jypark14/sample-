class Suspect < ApplicationRecord
  belongs_to :criminal
  belongs_to :investigation
end
