class ContactRequest < ApplicationRecord

  validates_presence_of :first_name, :email

end
