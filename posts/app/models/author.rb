class Author < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :birth_date, presence: true
  validates_format_of :birth_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy"
  before_save :validate_name
  before_save :validate_birth_date

  def validate_name
    if name.nil? || name == '' || is_number_integer?(name)
      throw :abort
    end
  end

  def is_number_integer?(object)
    !!(!object.empty? && object !~ /\D/)
  end

  def validate_birth_date
    unless !!Date.parse(birth_date)
      throw :abort
    end
  end

  def self.add_post_to_author(author_id, post)
    if Author.where("id = #{author_id}")
      author = Author.where("id = #{author_id}")
      post.author_id = author.id
      post.save!
    else
      throw Exception.new('cannot add author to post. Something is wrong')
    end
  end
end
