class Office::Api::ClientsController < Office::BaseController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params.merge(password: '1234567890'))
    if @client.save!
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def reset_password
    puts '-----------'
    puts 'Here logic for reset password. Now just simple update to 12345678'
    puts '-----------'

    @client = Client.find(params[:id])
    if @client.update(password: '12345678')
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  private

  def client_params
    params.require(:client).permit(:full_name, :phone, :email)
  end
end
