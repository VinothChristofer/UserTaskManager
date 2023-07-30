class ApiUser < User
    # include Devise::JWT::RevocationStrategies::JTIMatcher
    # devise :jwt_authenticatable, jwt_revocation_strategy: self
    # validates :jti, presence: true
    # def generate_jwt
    #   JWT.encode({ id: id,
    #                role: "user",
    #                exp: 2.hours.from_now.to_i },
    #                Rails.application.credentials.devise_jwt_secret_key!)
    # end
  end