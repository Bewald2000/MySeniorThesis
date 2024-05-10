class User < ApplicationRecord
    include Visible

    acts_as_authentic do |c|
        c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
        c.log_in_after_create = true
        c.log_in_after_password_change = false
    end # the configuration block is optional

    has_many :degrees, dependent: :destroy
    has_many :awards, dependent: :destroy
    has_many :work, dependent: :destroy

    validates :fnames, presence: true
    validates :lname, presence: true, length: { minimum: 2}
    validates :prename, allow_blank: true, length: {maximum: 8}
    validates :email, presence: true, format: {with: /@/, message: "should look like an email address."}, length: { maximum: 100 }, uniqueness: {case_sensitive: false, if: :will_save_change_to_email?}
    validates :phonenumber, presence: true, length: { minimum: 13}
    validates :login, format: {with: /\A[A-Za-z0-9]+\z/, message: "should use only letters and numbers."}, length: { within: 3..100 }, uniqueness: {case_sensitive: true, if: :will_save_change_to_login?}
    validates :password, confirmation: { if: :require_password? }, length: {minimum: 8, if: :require_password?}
    validates :password_confirmation, length: { minimum: 8, if: :require_password?}

    VALID_STATUSES - ['public', 'private', 'archived']
    validates :status, inclusion: { in: VALID_STATUSES }

    def archived?
        status == 'archived'
    end
end
