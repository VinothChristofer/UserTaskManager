class User < ApplicationRecord
  extend Devise::Models

  has_one :user_location_info
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  after_commit :addLocationInfo

  private
  def addLocationInfo
    # This way even if location update happens in future location information will be automatically updated
    coordinates = Geocoder.coordinates(self.address) 
    # check if user already exists in UserLocationInfo table
    if UserLocationInfo.where(user_id: self.id).empty?
      UserLocationInfo.create(user_id:self.id, latitude: coordinates[0], longitude: coordinates[1])
    else
      UserLocationInfo.update(user_id:self.id, latitude: coordinates[0], longitude: coordinates[1])
    end
  end
end
