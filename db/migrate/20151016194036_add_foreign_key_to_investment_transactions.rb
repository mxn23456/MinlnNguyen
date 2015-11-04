class AddForeignKeyToInvestmentTransactions < ActiveRecord::Migration
  def change
	  add_foreign_key :investment_transactions, :investments, column: :investment_desc, primary_key: "investment_desc"
  end
end
