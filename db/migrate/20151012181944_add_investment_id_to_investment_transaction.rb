class AddInvestmentIdToInvestmentTransaction < ActiveRecord::Migration
  def change
    add_column :investment_transactions, :investment_id, :integer
  end
end
