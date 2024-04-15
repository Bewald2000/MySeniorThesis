class User < ApplicationRecord
    acts_as_authlogic
    include Visible

    has_many :degrees, dependent: :destroy
    has_many :awards, dependent: :destroy
    has_many :work, dependent: :destroy

    validates :fname, presence: true
    validates :lname, presence: true, length: { minimum: 2}
    validates :prename, allow_blank: true, length: {maximum: 8}
    validates :email, presence: true, format: {with: /@/, message: "should look like an email address."}, length: { maximum: 100 }, uniqueness: {case_sensitive: false, if: :will_save_change_to_email?}
    validates :phonenumber, presence: true, length: { minimum: 14}
    validates :username, format: {with: /\A[a-z0-9]+\z/, message: "should use only letters and numbers."}, length: { within: 3..100 }, uniqueness: {case_sensitive: true, if: :will_save_change_to_login?}
    validates :password, confirmation: { if: :require_password? }, length: {minimum: 8, if: :require_password?}
    validates :encryptedpassword, length: { minimum: 8, if: :require_password?}

    VALID_STATUSES - ['public', 'private', 'archived']
    validates :status, inclusion: { in: VALID_STATUSES }

    def archived?
        status == 'archived'
    end
end
