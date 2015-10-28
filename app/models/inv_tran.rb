class InvTran < ActiveRecord::Base
	belongs_to :investment, dependent: :destroy

	def self.getMonthOfYearTrans(month,year)
		temp_date = Date.new(year,month,1)
		eom = temp_date.end_of_month
		bom = temp_date.beginning_of_month
		#year_end = temp_date.end_of_year
		#year_begin = temp_date.beginning_of_year
		where("transaction_date >= ? and transaction_date <= ?",bom,eom)
	end

	def self.monthlyExpense(month)
	end

	def self.montlyIncome(month)
	end
end
