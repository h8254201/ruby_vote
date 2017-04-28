class Candidate < ApplicationRecord
  validates :name, presence: true
  has_many :logs
  def vote
    self.votes = self.votes + 1
    save
  end
end