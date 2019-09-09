class Cabinet::BaseController < ApplicationController
  layout 'cabinet'
  before_action :authenticate_client!
end
