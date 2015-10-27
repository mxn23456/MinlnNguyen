class InvTran < ActiveRecord::Base
	belongs_to :investment, dependent: :destroy

	def self.monthlyExpense(month)
	end

	def self.montlyIncome(month)
	end
end
