class Office::BaseController < ApplicationController
  layout 'office'
  before_action :authenticate_staff!
end
