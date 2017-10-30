class Invoice < ApplicationRecord
  validates_presence_of :fee_in_cents
end
