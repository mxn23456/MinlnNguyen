class InvTransController < ApplicationController
	before_action :set_inv_tran, only: [:show, :edit, :update, :destroy]
	before_filter :get_inv

	# GET /inv_trans
	# GET /inv_trans.json
	def index
		@inv_trans = @inv.inv_trans.all
	end

	# GET /inv_trans/1
	# GET /inv_trans/1.json
	def show
	end

	# GET /inv_trans/new
	def new
		@inv_tran = @inv.inv_trans.new
	end

	# GET /inv_trans/1/edit
	def edit
	end

	# POST /inv_trans
	# POST /inv_trans.json
	def create
		#@inv_tran = @inv.inv_trans.new(inv_tran_params)
		@inv_tran = @inv.inv_trans.new
		@inv_tran[:transaction_desc] = inv_tran_params[:transaction_desc]
		@inv_tran[:transaction_date] = inv_tran_params[:transaction_date]
		@inv_tran[:amount] = inv_tran_params[:amount]

		respond_to do |format|
			if @inv_tran.save
				format.html { redirect_to inv_inv_trans_url(@inv), notice: 'Inv tran was successfully created.' }
				format.json { render :show, status: :created }
			else
				format.html { render :new }
				format.json { render json: @inv_tran.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /inv_trans/1
	# PATCH/PUT /inv_trans/1.json
	def update
		respond_to do |format|
			if @inv_tran.update(inv_tran_params)
				format.html { redirect_to inv_inv_tran_url(@inv,@inv_tran), notice: 'Inv tran was successfully updated.' }
				format.json { render :show, status: :ok }
			else
				format.html { render :edit }
				format.json { render json: @inv_tran.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /inv_trans/1
	# DELETE /inv_trans/1.json
	def destroy
		@inv_tran.destroy
		respond_to do |format|
			format.html { redirect_to inv_inv_trans_url, notice: 'Inv tran was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_inv_tran
		@inv_tran = InvTran.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def inv_tran_params
		params.require(:inv_tran).permit(:amount, :inv_desc,:transaction_desc, :inv_id, :transaction_date)
		#whitelist the entire hash
		#params.require(:inv_tran).permit!
		#params.permit(:inv_desc)
	end

	def get_inv
		if params[:inv_id] == "0"
			@inv = Inv.find_by(inv_desc: inv_tran_params[:inv_desc])
			params[:inv_desc] = (@inv.id).to_s
		else
			@inv = Inv.find(params[:inv_id])
		end
	end
end
