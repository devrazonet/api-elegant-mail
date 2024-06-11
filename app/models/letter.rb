class Letter < ApplicationRecord
  validates :reciever, :message, presence: true
  enum status: { pending: "pending", approved: "approved", archived: "archived" }
end
