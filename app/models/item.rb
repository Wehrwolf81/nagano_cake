class Item < ApplicationRecord
  attachment :image
  belong_to :genre
end
