class User < ApplicationRecord
  has_many :products
  before_create :generate_jti
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
          jwt_revocation_strategy: JwtDenylist

  enum :role, {
    customer: 0,
    vendor: 1,
    admin: 2,
    super_admin: 3
  }

  private

  def generate_jti
    self.jti = SecureRandom.uuid
  end
end
