class Slide < ActiveRecord::Base
  belongs_to :slider

  has_attached_file :image_slide, :styles => { :small => "150x150", :medium => "300x300" },
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
     :url => "/system/:attachment/:id/:style/:filename"
                  # :url  => "/assets/products/:id/:style/:basename.:extension",
                  # :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"


  validates_attachment_size :image_slide, :less_than => 5.megabytes
  validates_attachment_content_type :image_slide, :content_type => ['image/jpeg', 'image/png']

	 # has_attached_file :avatar,
  #     :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  #     :url => "/system/:attachment/:id/:style/:filename"

end
