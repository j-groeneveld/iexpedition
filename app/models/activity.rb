class Activity < ApplicationRecord
  has_many :order_items, as: :productable
  has_many :activity_groupings, dependent: :destroy
  has_many :voyages, through: :activity_groupings

  has_attached_file :image, default_url: "/assets/missing-activity.png", styles: { original: "512x512>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  # validates_uniqueness_of :name, scope: [:price, :overview], message: ", price and overview should be unique"
  validates_presence_of :name, :price

  scope :voyage, -> (voyage_id) { joins(:activity_groupings).where(activity_groupings: { voyage_id: voyage_id }) }
  scope :mandatory, -> { where(is_mandatory: true) }
  scope :not_mandatory, -> { where(is_mandatory: false) }

  def identifier_s
    "#{self.name} for #{self.price}"
  end
end
