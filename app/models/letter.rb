class Letter < ApplicationRecord
  validates :reciever, :message, presence: true
end
