class RemoveLdapInfoFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :ldap_info
  end

  def down
    add_column :users, :ldap_info, :text
  end
end
