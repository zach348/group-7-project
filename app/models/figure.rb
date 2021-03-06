class Figure < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :ratings
  belongs_to :user

  validates :name, presence: true
  validates :occupation, presence: true
  validates :nationality, presence: true
  validates :era, presence: true
  validates :claim_to_fame, presence: true

  def average_rating
    if ratings.empty? then return 0 end
    sum = ratings.reduce(0){|memo, rating| memo += rating.rating}
    average_rating = sum.to_f / ratings.length
    average_rating.round(2)
  end

  def self.search(search)
    where('name ILIKE ?', "%#{search}%")
  end
end
