class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #0:製作不可, 1:製作待ち, 2:製作中, 3:製作完了
  enum status: %i(0 1 2 3) 

end
