class Office::Api::HardwaresController < Office::BaseController
  def index
    @hardwares = Hardware.all
  end
end
