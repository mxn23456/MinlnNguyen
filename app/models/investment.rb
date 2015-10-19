class Investment < ActiveRecord::Base
	self.primary_key = "investment_desc"
	has_many :investment_transactions
end
