class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  enum gender: [:male, :female, :transgender]

  belongs_to :team, inverse_of: :users
  belongs_to :hotel, inverse_of: :users,  optional: true
  has_many :bookings, dependent: :destroy
  has_many :wallet_histories, dependent: :destroy
  has_many :invites, class_name: "Invite", foreign_key: "sender_id"

  validates :email, uniqueness: true

  TEAMS = [ SUPER_ADMIN = ['Super Admin', 'Admin'], HOTEL_ADMIN = ['Hotel Admin'], HOTEL_STAFF = ['Hotel Staff'], NORMAL_USER = ['Normal User'] ].freeze

  after_create :set_coupon_code, :send_email_notification

  def team_name
    team.name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    team_name == 'Super Admin' || team_name == 'Hotel Admin' || team_name == 'Admin'
  end

  def user_hotel
    team_name = team.name

    query = if HOTEL_ADMIN.include?(team_name)
              hotel
            else
              self
            end
    query
  end

  def booking_data
    team_name = team.name
    query = if SUPER_ADMIN.include?(team_name)
              Booking.all
            else
              user_hotel.bookings
            end
    query
  end

  private

  def send_email_notification
    # UserMailer.welcome_email(self).deliver
  end

  def set_coupon_code
    coupon_code = SecureRandom.hex(4)
    self.update(coupon_code: coupon_code)
  end

end
