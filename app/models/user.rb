class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :campaigns, dependent: :destroy
  has_many :contributions, dependent: :destroy

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, presence: { message: 'Your name is required' }, on: :kyc
  validates :email, presence: { message: 'Your email is required' }, on: :kyc
  validates :city, presence: { message: 'City is required' }, on: :kyc
  validates :address, presence: { message: 'Address is required' }, on: :kyc
  validates :contact_number, presence: { message: 'Contact number is required' }, on: :kyc
  validates :country, presence: { message: 'Country is required' }, on: :kyc
  validates :email, uniqueness: { message: 'Email must be unique' }, on: :kyc

  validates :avatar, attachment_presence: { message: 'Image is required' }, on: :kyc
  validates_with AttachmentPresenceValidator, attributes: :avatar, on: :kyc
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes, on: :kyc

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
