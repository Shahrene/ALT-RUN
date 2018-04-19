class Group < ActiveRecord:: Base

  validates :name, length: { in: 6..20 } #ensures users enter a name for a group
  validates :photo, presence: true

  has_many :messages
end
