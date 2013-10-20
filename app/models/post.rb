class Post < ActiveRecord::Base
	# has_and_belongs_to_many :categories
	# has_many :categories_posts
	# has_many :categories, through: :categories_posts
	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :categories
  scope :by_category_id, lambda {|cid| joins(:categories).where(['categories.id=?', cid])}
	before_validation :create_slug
	validates_presence_of :title, :excerpt, :body, :publish_date


  def permalink
    return "#{publish_date.strftime('%Y')}/#{publish_date.strftime('%m')}/#{publish_date.strftime('%d')}/#{slug}"
  end

  private
    def create_slug
    if slug.blank?
        slug_url = self.title.downcase.gsub(/[^a-z0-9]+/i, '-')
        slug_url = slug_url.gsub(/(-)\z/, '')
        slug_url = slug_url.gsub(/^(-)/, '')
        self.slug = slug_url
     else    	
      clean_slug = self.slug.downcase.gsub(/[^a-z0-9]+/i, '-')
      clean_slug_trailing_dash = clean_slug.gsub(/(-)\z/, '')
      self.slug = clean_slug_trailing_dash
    end
end
end
