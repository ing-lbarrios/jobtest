class Post < ApplicationRecord
  validates :author_id, presence: true
  validates :content, presence: true
  validate :validate_author
  
  def validate_author
    author = Author.where("ID IN (#{author_id})").last
    errors.add(:base, "the author does not exist") if author.nil?  
  end
end
