class Post < ApplicationRecord
  before_save :validate_author

  def validate_author
    author = Author.where("ID IN (#{author_id})").last

    unless author_id.nil? || author.nil?
      throw :abort
    end
  end
end
