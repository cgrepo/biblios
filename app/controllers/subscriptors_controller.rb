class SubscriptorsController < ApplicationController
  before_action :set_subscriptor, only: [:show, :edit, :update, :destroy]

  # GET /subscriptors
  # GET /subscriptors.json
  def index
    @subscriptors = Subscriptor.all
  end

  # GET /subscriptors/1
  # GET /subscriptors/1.json
  def show
  end

  # GET /subscriptors/new
  def new
    @subscriptor = Subscriptor.new
  end

  # GET /subscriptors/1/edit
  def edit
  end

  # POST /subscriptors
  # POST /subscriptors.json
  def create
    @subscriptor = Subscriptor.new(subscriptor_params)

    respond_to do |format|
      if @subscriptor.save
        format.html { redirect_to @subscriptor, notice: 'Subscriptor creado satisfactoriamente!.' }
        format.json { render :show, status: :created, location: @subscriptor }
      else
        format.html { render :new }
        format.json { render json: @subscriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptors/1
  # PATCH/PUT /subscriptors/1.json
  def update
    respond_to do |format|
      if @subscriptor.update(subscriptor_params)
        format.html { redirect_to @subscriptor, notice: 'Subscriptor actualizado satisfactoriamente!.' }
        format.json { render :show, status: :ok, location: @subscriptor }
      else
        format.html { render :edit }
        format.json { render json: @subscriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptors/1
  # DELETE /subscriptors/1.json
  def destroy
    @subscriptor.destroy
    respond_to do |format|
      format.html { redirect_to subscriptors_url, notice: 'Subscriptor borrado satisfactoriamente!.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriptor
      @subscriptor = Subscriptor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriptor_params
      params.require(:subscriptor).permit(:account, :fullname, :group_id, :school_id, :email, :address, :colony, :city, :state, :cp, :telephone, :celular, :picture, :notes, :vigencyStart, :vigencyEnd, :age, :gurantor)
    end
end
