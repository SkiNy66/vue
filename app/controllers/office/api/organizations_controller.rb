class Office::Api::OrganizationsController < Office::BaseController
  def index
    @organizations = Organization.all
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save!
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    if @organization.destroy!
      render json: { result: "Success" }, status: 200
    else
      render json: { result: "Error" }, status: 422
    end
  end

  private

  def organization_params
    params.require(:organization).permit!.except(:__index)
  end
end
