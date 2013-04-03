class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :registerable,   :recoverable,:validatable,:rememberable

  devise :ldap_authenticatable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login,  :password, :password_confirmation, :remember_me,
                  :email, :username, :ldap_entries

  before_save :get_ldap_info

  def ldap_info
    #load Marshaled obj
    Marshal.load(self.ldap_entries)
  end

  private
  def get_ldap_info
      #self.email = Devise::LdapAdapter.get_ldap_param(self.login,"mail")
      ldap = Net::LDAP.new
      ldap.host = 'bjpw01.f2.enterprise'
      ldap.auth('i0040679@research', 'r&dchina2012')
      filter = Net::LDAP::Filter.eq("samaccountname", self.login)
      base = "dc=f2, dc=enterprise"
      ldap_entry = nil
      ldap.search(:base => base, :filter => filter) {|entry| ldap_entry = entry}
      self.email = ldap_entry.mail.first
      self.username = ldap_entry.displayname.first
      self.ldap_entries = Marshal.dump(ldap_entry)
  end

  #  def username
#    first= email.split("@")[0].split(".")[0]
#    last=email.split("@")[0].split(".")[1]
#    "#{first.titleize} #{last ? last.titleize : ""}"
#  end
end
