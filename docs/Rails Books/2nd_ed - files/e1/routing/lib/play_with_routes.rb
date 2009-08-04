#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
def rs
  ActionController::Routing::Routes
end

class MockRequest
  attr_accessor :path, :path_parameters, :host, :subdomains, :domain, :method

  def initialize(values={})
    values.each { |key, value| send("#{key}=", value) }
    if values[:host]
      subdomain, self.domain = values[:host].split(/\./, 2)
      self.subdomains = [subdomain]
    end
  end
end

class MockController
  attr_accessor :routes

  def initialize(routes)
    self.routes = routes
  end

  def url_for(options)
    only_path = options.delete(:only_path)
    path = routes.generate(options)
    only_path ? path : "http://named.route.test#{path}"
  end
end

def request
  @request ||= MockRequest.new(:host => "named.routes.test", :method => :get)
end
