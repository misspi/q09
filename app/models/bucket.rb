class Bucket < ActiveRecord::Base
  has_attached_file :media, :styles => { :small => "150x150>" },
    :url  => "/assets/buckets/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/buckets/:id/:style/:basename.:extension"

  validates_attachment_presence :media


  def thumbnail
    if media_content_type =~ /image/
      self.media.url(:small)
    elsif media_content_type == 'application/pdf'
      '/images/pdf.gif'
    else
      '/images/archivo.gif'
    end
  end

  def to_json
    { :bucket_id => self.id, :thumbnail => self.thumbnail, :url => self.media.url}.to_json
  end

end
