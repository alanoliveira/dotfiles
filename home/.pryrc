begin
  Gem.path.each { |gemset|  $:.concat(Dir.glob("#{gemset}/gems/awesome_print-*/lib/")) }
  $:.uniq!
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError => err
  puts err
end

