class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of [:email]
  has_many :orders
  has_many :voyages, through: :orders
  has_one :address
  has_one :passport
  has_one :emergency_contact
  has_one :travel_detail_post, class_name: 'TravelDetail'
  has_one :travel_detail_pre, class_name: 'TravelDetail'
  has_many :favourite_voyages
  has_many :wishlist_voyages, through: :favourite_voyages, source: :voyage
  has_many :favourite_ships
  has_many :wishlist_ships, through: :favourite_ships, source: :ship


  def wishlist
    self.wishlist_voyages + self.wishlist_ships
  end

  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def latest_current_order
    self.current_orders.order("updated_at DESC").first
  end

  def current_orders
    self.orders.where(status: ["cart", "reserved", "deposit", "confirmed", "paid"])
  end
end