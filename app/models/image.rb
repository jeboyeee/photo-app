class Image < ActiveRecord::Base
  belongs_to :user #added automatically because we did the scaffold then use reference (rails generate scaffold Image name:string picture:string user:references)
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
