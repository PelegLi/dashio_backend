class ItemsController < ApplicationController
  respond_to :json
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :validate_params, only: [:create]

  def show
    render json: @item
  end

  def create
    @item = Object.const_get(params["item"]["type"]).new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      render json: @item, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def validate_params
    begin
      Object.const_get(params["item"]["type"]) < Item
    rescue
      render json: {error: "invalid parameters"}, status: :unprocessable_entity
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:category_id, :type)
  end
end
