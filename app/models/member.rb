class Member < ApplicationRecord
  validates_format_of :email, :with => /@/

  def verify
    self.verified = true

    self.save
  end

  def unverify
    self.verified = false

    self.save
  end
end
