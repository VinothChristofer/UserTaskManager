class User < ApplicationRecord
  extend Devise::Models
  # include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  before_create :add_jti

  # enum role: [:guest, :user, :admin]
  # after_initialize :set_default_role, :if => :new_record?

  private
  def add_jti
    self.jti ||= SecureRandom.uuid
  end

  # def set_default_role
  #   self.role ||= :guest
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
