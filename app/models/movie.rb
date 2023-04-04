class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks
  before_destroy :set_destroyed_by_movie

  private

  def set_destroyed_by_movie
    if bookmarks.loaded? || bookmarks.exists?
      raise ActiveRecord::InvalidForeignKey.new("should not be able to destroy self if has bookmarks children")
    end
  end
end
