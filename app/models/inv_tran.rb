class InvTran < ActiveRecord::Base
	belongs_to :investment, dependent: :destroy
end
