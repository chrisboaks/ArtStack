# Pulls all artwork from db

require 'open-uri'

urls = Artwork.all.map(&:image).map(&:url)

urls.each_with_index do |url, i|
  num = (i+1).to_s.rjust(3, '0')
  ext = File.extname(url).split('?').first
  File.open("#{num}#{ext}", "w") do |f|
    f << open(url).read
  end
end


# Reseeds db with images [UNTESTED]

works = Artwork.all
images = Dir.entries("../originals").select {|f| !File.directory? f}

works.each_with_index do |work, i|
  work.update(image: images[i])
end

# Finds and sets image sizes
# Doesn't work for images with ' in name

works = Artwork.all
works.each do |work|
  next if work.dimensions
  url = work.image.url
  dims = Paperclip::Geometry.from_file(url)
  w = dims.width.to_i
  h = dims.height.to_i
  work.update(dimensions: [w, h])
end

#
# def extract_dimensions
#   tempfile = image.queued_for_write[:original]
#   unless tempfile.nil?
#     geometry = Paperclip::Geometry.from_file(tempfile)
#     self.dimensions = [geometry.width.to_i, geometry.height.to_i]
#   end
# end
