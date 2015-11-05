class CreateInvestments < ActiveRecord::Migration
	def change
		create_table :investments, id: false do |t|
			t.string :investment_desc, null: false
			t.text :notes

			t.timestamps null: false
		end
		add_index :investments, :investment_desc, unique: true

	end
end
