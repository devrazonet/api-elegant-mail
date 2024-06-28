class Letter < ApplicationRecord
  validates :reciever, :message, presence: true
  enum status: { pending: "pending", approved: "approved", archived: "archived" }

  after_create :update_json

  private

  def update_json
    home_dir = Dir.home
    file_path = Rails.root.join(home_dir, "Documentos", "correio_ap", "correio.json")

    FileUtils.mkdir_p(File.dirname(file_path))

    data = { id: self.id, mensagem: " * ** Eiii, #{self.reciever}!!!, Tenho um recadinho procê! Corre la pra vê   :love_letter:" }

    File.write(file_path, JSON.pretty_generate(data))
  end
end
