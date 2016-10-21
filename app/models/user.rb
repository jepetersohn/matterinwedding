require 'bcrypt'

class User < ActiveRecord::Base

  def validate_password
    if @raw_password.nil?
      errors.add(:password_hash, "is required")
    elsif @raw_password.length < 8
      errors.add(:password_hash, "must be 8 characters or more")
    end
  end

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = BCrypt::Password.create(plain_text_password)
    self.password_hash =@password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end
end
