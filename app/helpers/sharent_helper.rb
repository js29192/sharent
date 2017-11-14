module SharentHelper
  def get_cities
    City.select(:id, :name).order(:name).uniq
  end
end
