class InvTransController < ApplicationController
  before_action :set_inv_tran, only: [:show, :edit, :update, :destroy]

  # GET /inv_trans
  # GET /inv_trans.json
  def index
    @inv_trans = InvTran.all
  end

  # GET /inv_trans/1
  # GET /inv_trans/1.json
  def show
  end

  # GET /inv_trans/new
  def new
    @inv_tran = InvTran.new
  end

  # GET /inv_trans/1/edit
  def edit
  end

  # POST /inv_trans
  # POST /inv_trans.json
  def create
    @inv_tran = InvTran.new(inv_tran_params)

    respond_to do |format|
      if @inv_tran.save
        format.html { redirect_to @inv_tran, notice: 'Inv tran was successfully created.' }
        format.json { render :show, status: :created, location: @inv_tran }
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
        format.html { redirect_to @inv_tran, notice: 'Inv tran was successfully updated.' }
        format.json { render :show, status: :ok, location: @inv_tran }
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
      format.html { redirect_to inv_trans_url, notice: 'Inv tran was successfully destroyed.' }
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
      params.require(:inv_tran).permit(:amount, :trans_desc, :investment_id, :trans_date)
    end
end
