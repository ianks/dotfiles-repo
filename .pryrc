# frozen_string_literal: true
# vi: ft=ruby

# == Pry-Nav - Using pry as a debugger ==
begin
  Pry.commands.alias_command 'c', 'continue'
rescue
  nil
end
begin
  Pry.commands.alias_command 's', 'step'
rescue
  nil
end
begin
  Pry.commands.alias_command 'n', 'next'
rescue
  nil
end

# === CUSTOM COMMANDS ===
# from: https://gist.github.com/1297510
default_command_set = Pry::CommandSet.new do
  command "copy", "Copy argument to the clip-board" do |str|
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  command "clear" do
    system 'clear'
    output.puts "Rails Environment: " + ENV['RAILS_ENV'] if ENV['RAILS_ENV']
  end

  command "sql", "Send sql over AR." do |query|
    if ENV['RAILS_ENV'] || defined?(Rails)
      pp ActiveRecord::Base.connection.select_all(query)
    else
      pp "No rails env defined"
    end
  end
end

Pry.config.commands.import default_command_set

begin
  require 'pry-theme'
  Pry.config.theme = 'zenburn'
rescue LoadError
  puts '$ gem install pry-theme  <-- Highly recommended.'
end

begin
  require 'pry-byebug'
rescue LoadError
  puts '$ gem install pry-byebug  <-- Highly recommended.'
end

# === CONVENIENCE METHODS ===
# Stolen from https://gist.github.com/807492
# Use Array.toy or Hash.toy to get an array or hash to play with
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i + 1 }
  end
end

class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n) { |c| (96 + (c + 1)).chr })]
  end
end

def open_html(body)
  require 'tempfile'
  file = Tempfile.new(['html_preview', '.html'])
  file.write body
  system "open #{file.path}"
end

def pbcopy(something)
  something.tap do |s|
    IO.popen("xclip -selection clipboard -in", "w") { |pipe| pipe.write s }
  end
end

def pbpaste
  IO.popen("xclip -selection clipboard -out", "r", &:read)
end
