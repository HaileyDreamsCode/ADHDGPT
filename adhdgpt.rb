require 'active_support/all'
require_relative 'web/lib/adhd_gpt.rb'
require 'openai'

if ARGV.count == 0 || ENV['OPENAI_API_KEY'].blank?
  puts "Need an argument and a valid OpenAI key."
  exit
end

puts AdhdGpt.get_task_list(ARGV.join(' '))
