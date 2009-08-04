#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
irb = RUBY_PLATFORM =~ /mswin32/ ? 'irb.bat' : 'irb'

require 'optparse'
options = { :sandbox => false, :irb => irb }

libs =  " -r irb/completion"
libs << " -r #{RAILS_ROOT}/config/environment"
libs << " -r console_app"
libs << " -r console_sandbox" if options[:sandbox]
libs << " -r console_with_helpers"
libs << " -r play_with_routes"

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
puts "Loading #{ENV['RAILS_ENV']} environment."

exec "#{options[:irb]} #{libs} --simple-prompt"