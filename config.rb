require 'active_support/core_ext/integer/inflections'
require 'builder'

Time.zone = 'US/Pacific'

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.remove   = false
  config.cascade = false
  config.inline  = true
end
activate :blog do |blog|
  blog.prefix = 'events'
  blog.permalink = '{year}/{month}/{day}/{title}.html'
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.taglink = 'tags/{tag}.html'
  blog.layout = 'blog'
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = '{year}.html'
  blog.month_link = '{year}/{month}.html'
  blog.day_link = '{year}/{month}/{day}.html'
  blog.default_extension = '.md'
  blog.tag_template = 'events/tag.html'
  blog.calendar_template = 'events/calendar.html'
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end
activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote   = 'git@github.com:sushiandrobots/themixinsf.com.git'
  deploy.branch   = 'gh-pages'
end
activate :directory_indexes
activate :livereload

compass_config do |config|
  config.output_style = :expanded
end

Sass::Script::Number.precision = 8

page '/feed.xml',   layout: false
page '/humans.txt', layout: false

set :css_dir,    'assets/css'
set :fonts_dir,  'assets/fonts'
set :haml, {
 :attr_wrapper => '"',
 :format => :xhtml,
 :ugly => false
}
set :images_dir,  'assets/img'
set :js_dir,      'assets/js'
set :markdown, :tables => true,
               :autolink => true,
               :gh_blockcode => true,
               :fenced_code_blocks => true,
               :with_toc_data => true,
               :smartypants => true
set :markdown_engine, :redcarpet

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets

  compass_config do |config|
    config.output_style = :compressed
  end

  set :relative_links, true
end