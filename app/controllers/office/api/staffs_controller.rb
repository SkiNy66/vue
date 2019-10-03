class Office::Api::StaffsController < Office::BaseController
  def index
    @staffs = Staff.all
  end

  def current_staff_email
    render json: { staff_email: current_staff.email }, status: 200
  end

  def create
    @staff = Staff.new(staff_params.merge(password: '1234567890'))
    if @staff.save!
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def reset_password
    puts '-----------'
    puts 'Here logic for reset password. Now just simple update to 12345678'
    puts '-----------'

    @staff = Staff.find(params[:id])
    if @staff.update(password: '12345678')
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def link_client_with_organization
    client = Client.find_by_id(params[:link][:client_id])
    organization = Organization.find_by_id(params[:link][:organization_id])
    if client && organization
      client.organizations << organization
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  private

  def staff_params
    params.require(:staff).permit!
  end

  def link_params
    params.require(:link).permit(:organization_id, :client_id)
  end
end