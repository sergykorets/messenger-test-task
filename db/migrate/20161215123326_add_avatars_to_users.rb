class AddAvatarsToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :avatar
    end
    User.create(name: "Admin", email: "admin@gmail.com", password: "11111111", password_confirmation: "11111111", role: "admin")
  end

  def self.down
    drop_attached_file :users, :avatar
  end
end
