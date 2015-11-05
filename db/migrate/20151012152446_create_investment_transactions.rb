class CreateInvestmentTransactions < ActiveRecord::Migration
  def change
    create_table :investment_transactions do |t|
      t.integer :amount
      t.string :transaction_desc
      t.date :transaction_date
      t.string :investment_desc

      t.timestamps null: false
    end
  end
end
