class User < ActiveRecord::Base
  has_secure_password
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happiness
      'sad'
    else 'happy'
    end
  end
end
