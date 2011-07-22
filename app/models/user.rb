
class User < ActiveRecord::Base

  cattr_reader :page
  @@page = 5

  has_many :albums
  has_many :comments
  has_many :photos, :through => :comments
  validates_presence_of :login_name, :login_password, :first_name, :last_name, :login_role,:email_id
  validates_uniqueness_of :login_name

  def name
    first_name + ' ' + last_name
  end 

end
