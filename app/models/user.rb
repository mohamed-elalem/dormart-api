class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, :confirmable, :async,
         jwt_revocation_strategy: JwtBlacklist

  validate :strong_password
  validates :password, confirmation: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true, if: :new_record?
  validates :password_confirmation, presence: true, if: :new_record?

  has_one_attached :avatar

  private

  def strong_password
    result = Zxcvbn.test(password)
    errors.add(:password, format_weak_password_message(result)) if result.score < PASSWORD_STRENGTH
  end

  def format_weak_password_message(result)
    "Password cracking time: #{result.crack_time_display}. Suggestions: #{result.feedback.suggestions.join(',')}"
  end
end
