class <%= user_class_name %> < ActiveRecord::Base
<%  if options[:authlogic] %>
  acts_as_authentic
<% else %>
  # new columns need to be added here to be writable through mass assignment

  attr_accessor :password
  before_save :prepare_password
  
  VALID_NAME_REGEX = /\A[-\w\._@]+\z/i
  VALID_EMAIL_REGEX = /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates :username, format: { with: VALID_NAME_REGEX, message: "should only contain letters, numbers, or .-_@" }, allow_blank: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    <%= user_singular_name %> = find_by_username(login) || find_by_email(login)
    return <%= user_singular_name %> if <%= user_singular_name %> && <%= user_singular_name %>.password_hash == <%= user_singular_name %>.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
<% end %>
end
