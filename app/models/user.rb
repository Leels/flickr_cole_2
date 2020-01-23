class User < ApplicationRecord
    has_many :albums
    has_one_attached :profile_picture
    has_one_attached :cover_photo
    attr_accessor :password
    validates_confirmation_of :password
    validates :email, :presence => true, :uniqueness => true
    validates :username, :presence => true, :uniqueness => true
    before_save :encrypt_password

    def encrypt_password
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end

    def self.authenticate(identifier, password)
        user = User.find_by("#{identifier.include?('@') ? 'email' : 'username'} = ?", identifier)
        (user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)) ? user : nil
    end
end
