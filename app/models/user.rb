class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pgs
  before_destroy :destroy_pgs

  def destroy_pgs
    self.pgs.destroy_all
  end
end
