class Post < ActiveRecord::Base
  validates :title, {presence: true}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    clickbait_patterns = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if clickbait_patterns.none?{|f| f.match(title)}
      errors.add(:title, "must be clickbait")
    end
  end
end
