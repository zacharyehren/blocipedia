class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy
  # has_many :wikis, through: :collaborators, as: :wiki_collaborations
  has_many :collaborators, dependent: :destroy

  after_initialize { self.role ||= :standard }
  before_save :check_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :admin, :premium]

  def check_role
    if self.customer_id != nil && self.standard?
      self.wikis.where(private: true).update_all(private: false)
    end
  end
end
