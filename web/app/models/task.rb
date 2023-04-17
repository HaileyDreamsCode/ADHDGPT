require 'kramdown'
require 'kramdown-parser-gfm'

class Task < ApplicationRecord
  def generated_tasks_html
    Kramdown::Document.new(generated_tasks, input: 'GFM').to_html
  end
end
