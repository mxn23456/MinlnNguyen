class InvestmentTransactionsController < ApplicationController
  before_action :set_investment_transaction, only: [:show, :edit, :update, :destroy]
  before_filter :get_investment

  # GET /investmetns/investment_id/investment_transactions
  # GET /investmetns/investment_id/investment_transactions.json
  def index
#	  byebug
    @investment_transactions = @investment.investment_transactions.all
	#Note: The following method fix the problem in which the current @investment_transacions encompasses more
	#	than the asked investment_id. Fix this problem using byebug when possible
	@investment_transactions = InvestmentTransaction.get_transactions_for_investment(@investment_transactions,
																					 params[:investment_id])
  end

  # GET /investmetns/investment_id/investment_transactions/1
  # GET /investmetns/investment_id/investment_transactions/1.json
  def show
  end

  # GET /investmetns/investment_id/investment_transactions/new
  def new
    @investment_transaction = @investment.investment_transactions.new
   # @investment_transaction = InvestmentTransaction.new
  end

  # GET /investmetns/investment_id/investment_transactions/1/edit
  def edit
  end

  # POST /investmetns/investment_id/investment_transactions
  # POST /investmetns/investment_id/investment_transactions.json
  def create
    @investment_transaction = @investment.investment_transactions.new(investment_transaction_params)
	@investment_transaction[:investment_desc] = params[:investment_id]

    respond_to do |format|
      if @investment_transaction.save
        format.html { redirect_to investment_investment_transactions_url(@investment), notice: 'Investment transaction was successfully created.' }
        #format.json { render :show, status: :created, location: @investment_transaction }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @investment_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investmetns/investment_id/investment_transactions/1
  # PATCH/PUT /investmetns/investment_id/investment_transactions/1.json
  def update
    respond_to do |format|
      if @investment_transaction.update(investment_transaction_params)
        format.html { redirect_to @investment_transaction, notice: 'Investment transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment_transaction }
      else
        format.html { render :edit }
        format.json { render json: @investment_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/investments_id/investment_transactions/1
  # DELETE /investments/investments_id/investment_transactions/1.json
  def destroy
    @investment_transaction.destroy
    respond_to do |format|
      format.html { redirect_to investment_investment_transactions_url(@investment), notice: 'Investment transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
	def get_investment
	  @investment = Investment.find(params[:investment_id])
	end

    # Use callbacks to share common setup or constraints between actions.
    def set_investment_transaction
      @investment_transaction = InvestmentTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_transaction_params
      params.require(:investment_transaction).permit(:investment_id, :amount, :transaction_desc, :transaction_date, :investment_desc)
    end
end
