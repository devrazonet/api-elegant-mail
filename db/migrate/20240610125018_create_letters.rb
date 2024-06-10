class CreateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :letters do |t|
      t.string :sender, default: "Anônimo"
      t.string :reciever
      t.string :message
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
