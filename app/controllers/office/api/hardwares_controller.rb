class Office::Api::HardwaresController < Office::BaseController
  def index
    @hardwares = Hardware.all
  end

  def create
    @hardware = Hardware.new(hardware_params)
    @hardware.save!
  end

  def update
    @hardware = Hardware.find(params[:id])
    if @hardware.update(hardware_params)
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def destroy
    @hardware = Hardware.find(params[:id])
    if @hardware.destroy!
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  private

  def hardware_params
    params.require(:hardware).permit!.except(:__index)
  end
end
