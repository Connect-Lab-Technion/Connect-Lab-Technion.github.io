# Create this file in your _plugins directory, e.g., _plugins/generate_gallery_yaml.rb

require 'yaml'

Jekyll::Hooks.register :site, :after_init do |site|
  image_dir = File.join(site.source, 'img', 'social', 'connect')
  yaml_path = File.join(site.source, '_data', 'gallery_slides.yml')

  gallery_data = Dir.glob(File.join(image_dir, '*')).map.with_index do |file, index|
    next unless File.file?(file) && ['.jpg', '.jpeg', '.png', '.gif'].include?(File.extname(file).downcase)
    
    {
      'title' => "Slide #{index + 1}",
      'description' => "Description for slide #{index + 1}",
      'image' => "/img/social/connect/#{File.basename(file)}"
    }
  end.compact

  File.open(yaml_path, 'w') { |f| f.write(gallery_data.to_yaml) }
end