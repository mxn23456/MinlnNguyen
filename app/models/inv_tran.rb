class InvTran < ActiveRecord::Base
	belongs_to :inv

	def self.getMonthOfYearTrans(month,year)
		temp_date = Date.new(year,month,1)
		eom = temp_date.end_of_month
		bom = temp_date.beginning_of_month
		where("transaction_date >= ? and transaction_date <= ?",bom,eom)
	end

	def self.getRecentDisctinctInvId(numOfLastInvs)
		lastAskedAmountFromEndOfList = numOfLastInvs * 2
		orderedList = []
		lastList = InvTran.last(lastAskedAmountFromEndOfList)
		y = lastList.size - 1
		while orderedList.size < numOfLastInvs
			if y < 0 
				newAmount = lastAskedAmountFromEndOfList + numOfLastInvs 
				lastList = InvTran.last(newAmount) - InvTran.last(lastAskedAmountFromEndOfList)
				if lastList.size == 0
					break
				end
				lastAskedAmountFromEndOfList = newAmount
				y = lastList.size - 1
			end
			tran = lastList[y]
			if(!orderedList.any? {|t| t == tran.inv_id})
				orderedList.append tran.inv_id
			end
			y = y - 1
		end
		return orderedList
	end
end
