class Letter < ApplicationRecord
  validates :reciever, :message, presence: true
  enum status: { pending: "pending", approved: "approved", archived: "archived" }

  after_create :update_json

  private

  def update_json
    file_path = Rails.root.join('public', 'json', 'correio.json')

    FileUtils.mkdir_p(File.dirname(file_path))

    data = { id: self.id, message: "Olá, #{self.reciever}, tenho uma nova mensagem para você." }
    
    File.write(file_path, JSON.pretty_generate(data))
  end
end
