class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :registerable,   :recoverable,
  devise :ldap_authenticatable, :validatable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login,  :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  #
  before_create :get_ldap_email

  def get_ldap_email
      #self.email = Devise::LdapAdapter.get_ldap_param(self.login,"mail")
      ldap = Net::LDAP.new
      ldap.host = 'bjpw01.f2.enterprise'
      ldap.auth('i0040679@research', 'r&dchina2012')
      filter = Net::LDAP::Filter.eq("mailnickname", self.login)
      base = "dc=f2, dc=enterprise"
      ldap_entry = nil
      ldap.search(:base => base, :filter => filter) {|entry| ldap_entry = entry}
      self.email = ldap_entry.mail.first
  end

end
