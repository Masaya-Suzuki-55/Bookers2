class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #Userモデルにbookモデルを関連付ける       
  has_many :books, dependent: :destroy
  #画像アップ用メソッド
  attachment :profile_image
end
