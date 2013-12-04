class AddImageColumnToSlides < ActiveRecord::Migration
  	def self.up
    add_attachment :slides, :image_slide
  end

  def self.down
    remove_attachment :slides, :image_slide
  end

end
