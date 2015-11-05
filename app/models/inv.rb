class Inv < ActiveRecord::Base
	has_many :inv_trans
	has_many :images
	has_attached_file :image, styles: { large: "600x600>",medium: "300x300>", thumb: "150x150#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.get_recent_invs(num_of_last_invs)
		inv_id_list = InvTran.getRecentDisctinctInvId(num_of_last_invs)
		result_list = []
		inv_id_list.each do |x|
			inv = Inv.find(x)
		#	inv["image_url"] = inv
			#res = inv.as_json
			#res["featured_image_url"] = inv.image.url(:medium)
			result_list.append inv 
		end
		#render json: result_list
	    #	render raw: result_list
		#render json: result_list.as_json
		return result_list
	end

end
