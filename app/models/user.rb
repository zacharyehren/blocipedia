class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy

  after_initialize { self.role ||= :standard }
  before_save :check_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :admin, :premium]

  def check_role
    if self.customer_id != nil && self.role == :standard
      customer = Stripe::Customer.retrieve(self.customer_id)
      customer.delete
      self.customer_id = nil
      if self.customer_id == nil
        puts"You have successfully downgraded your account to standard, #{self.email}."
      else
        puts "There was an error updating your account."
      end
    end
  end
end
