class Group < ActiveRecord:: Base

  validates :name, length: { in: 5..25 } #ensures users enter a name for a group
  # validates :photo, presence: true

  has_many :messages
end
