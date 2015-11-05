class InvestmentTransaction < ActiveRecord::Base
	belongs_to :investment, foreign_key: "investment_desc"

	#Note: This is a temporary method for retrieving the transaction. Consider using the 
	#	provided rails convention
	def self.get_transactions_for_investment(transactions,investment_desc)
		res=[]
		for n in 0..(transactions.size-1)
			if transactions[n][:investment_desc] == investment_desc
				res.append(transactions[n])
			end
		end
		return res
	end

	def get_total_spent(investment_desc)
	end

	def get_monthly_transactions(investment_desc,month)
	end







end
