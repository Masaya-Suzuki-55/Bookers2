class Book < ApplicationRecord
  
  #bookモデルにUserモデルを関連付ける
  belongs_to :user
  
end
