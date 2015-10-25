class InvsController < ApplicationController
  before_action :set_inv, only: [:show, :edit, :update, :destroy]

  # GET /invs
  # GET /invs.json
  def index
    @invs = Inv.all
  end

  # GET /invs/1
  # GET /invs/1.json
  def show
  end

  # GET /invs/new
  def new
    @inv = Inv.new
  end

  # GET /invs/1/edit
  def edit
  end

  # POST /invs
  # POST /invs.json
  def create
    @inv = Inv.new(inv_params)

    respond_to do |format|
      if @inv.save
        format.html { redirect_to @inv, notice: 'Inv was successfully created.' }
        format.json { render :show, status: :created, location: @inv }
      else
        format.html { render :new }
        format.json { render json: @inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invs/1
  # PATCH/PUT /invs/1.json
  def update
    respond_to do |format|
      if @inv.update(inv_params)
        format.html { redirect_to @inv, notice: 'Inv was successfully updated.' }
        format.json { render :show, status: :ok, location: @inv }
      else
        format.html { render :edit }
        format.json { render json: @inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invs/1
  # DELETE /invs/1.json
  def destroy
    @inv.destroy
    respond_to do |format|
      format.html { redirect_to invs_url, notice: 'Inv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inv
      @inv = Inv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inv_params
      params.require(:inv).permit(:inv_desc, :notes)
    end
end
