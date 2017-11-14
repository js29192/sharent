class SharentController < ApplicationController
  def home
  end

  def search
    @pgs = Pg.where(city_id: params[:city_id])
  end

  def book
    @enquiry = Enquiry.new
    @enquiry.pg_id = params[:pg_id]
  end

  def create_enquiry
  	@enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      redirect_to root_path
    else
      render 'book'
    end
  end

  def contact
  end

  def action
  end

  private

  def enquiry_params
    params.fetch(:enquiry, {}).permit(:pg_id, :full_name, :mobile_number, :number_of_seats, :room_type_id)
  end
end
