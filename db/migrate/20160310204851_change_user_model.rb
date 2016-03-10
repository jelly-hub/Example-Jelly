class ChangeUserModel < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.remove :e_mail, :password_digest
  		t.string :e_mail
  		t.string :password_digest
  	end
  end
end
