# Bring in Recipes
require File.join(File.dirname(__FILE__), '..', 'recipes', 'lib', 'compass-recipes')

# Compass configurations
sass_path = File.dirname(__FILE__)
css_path = File.join(sass_path, "..", "css")

# Require any additional compass plugins here.
images_path = File.join(sass_path, "..", "img")
images_dir = '../img'

relative_assets = true
output_style = :compressed
environment = :production