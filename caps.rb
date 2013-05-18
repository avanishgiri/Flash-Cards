File.open('test').each do |line|

  line = line.split
  unless line[1] =~ /[A-Z][A-Z]/
   puts line[0] + ' ' + line[1] + "---" + line[4]
  end
end
