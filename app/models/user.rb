class User < ActiveRecord::Base
  has_many :pictures
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default-user.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def admin?
    self.role == "Admin"
  end
end
