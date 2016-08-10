class User < ActiveRecord::Base
#use this to authenticate api request via token
#acts_as_token_authenticatable

# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable

#NOTE the following 2 lines are old, before following examples by devise-api-demo
#devise :database_authenticatable, :registerable,
#       :recoverable, :rememberable, :trackable, :validatable

       #NOTE the follwoing are copied from devise-api-demo
#       acts_as_token_authenticatable
       devise :database_authenticatable, :registerable

       has_many :invs


    #NOTE comment out due to following devise-api-demo
       #before_save :ensure_authentication_token
       # def ensure_authentication_token
      #    if authentication_token.blank?
      #    self.authentication_token = generate_authentication_token
      #    end
      # end

      # private

      # def generate_authentication_token
      #      loop do
      #          token = Devise.friendly_token
      #          break token unless User.where(authentication_token: token).first
      #      end
      # end

end
