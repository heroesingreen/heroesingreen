#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---

require "rdoc_template"

ActionView::Base.register_template_handler("rdoc", RDocTemplate)


require "eval_template"
ActionView::Base.register_template_handler("reval", EvalTemplate)


class ApplicationController < ActionController::Base
end
