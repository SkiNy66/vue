class Office::WelcomeController < Office::BaseController
  def index
  end

  def list
    render json: { list: Client.all.map{|c| { full_name: c.full_name, email: c.email , phone: c.phone, id: c.id}}}, status: 200
  end

  def current_staff_email
    render json: { staff_email: current_staff.email }, status: 200
  end

  def create_new_client
    @client = Client.new(client_params.merge(password: '1234567890'))
    if @client.save!
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
