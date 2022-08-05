class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  validates :nickname, presence: true
  validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/}, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}, presence: true
  validates :first_name_kana,format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :last_name_kana,format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'must include both alphabetic and numeric characters' 


end
