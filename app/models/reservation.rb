class Reservation < ApplicationRecord
  belongs_to :room
  after_initialize :init
  validates :start_date, presence: true
  validate :start_date_greater_than, on: :create
  validates :end_date, presence: true
  validate :end_date_greater_than, on: :create
  validates :guest_last_name, presence: true

  def init
    self.daily_rate ||= 200.0
  end

  def start_date_greater_than
    errors.add(:start_date, "can't be in the past") if
      start_date < Date.today
  end

  def end_date_greater_than
    errors.add(:end_date, "can't be in the past") if
      end_date < Date.tomorrow
  end
end
