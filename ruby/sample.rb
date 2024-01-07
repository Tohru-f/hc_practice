require 'optparse'
opt = OptionParser.new

month = []
opt.on('-m int') {|m| month << m.to_i}
p ARGV

opt.parse!(ARGV)

p month