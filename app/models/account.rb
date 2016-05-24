class Account < ActiveRecord::Base
  attr_accessor :paypassword
  belongs_to :user
  has_many :basics, as: :finance
  validates :bank_account, presence: true, length: {maximum:50},uniqueness: { case_sensitive: false }
  validates :bank_account_no, presence: true, length: {maximum:50 }
  validates :bank_phone, length: {maximum: 20}
  validates :paypassword, presence: true, length: { minimum: 6 }

  include ActiveModel::Validations
    # This ensures the model has a password by checking whether the password_digest
    # is present, so that this works with both new and existing records. However,
    # when there is an error, the message is added to the password attribute instead
    # so that the error message will make sense to the end-user.
    validate do |record|
      record.errors.add(:paypassword, :blank) unless record.paypassword_digest.present?
    end

    validates_length_of :paypassword, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED
    validates_confirmation_of :paypassword, allow_blank: true

  if respond_to?(:attributes_protected_by_default)
    def self.attributes_protected_by_default #:nodoc:
      super + ['paypassword_digest']
    end
  end

  #attr_reader :paypassword


  def paypassword=(unencrypted_password)
    if unencrypted_password.nil?
      self.paypassword_digest = nil
    elsif !unencrypted_password.empty?
      @paypassword = unencrypted_password
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      self.paypassword_digest = BCrypt::Password.create(unencrypted_password, cost: cost)
    end
  end

  def paypassword_confirmation=(unencrypted_password)
    @paypassword_confirmation = unencrypted_password
  end

  def authenticate(unencrypted_password)
    BCrypt::Password.new(paypassword_digest) == unencrypted_password && self
  end
end
