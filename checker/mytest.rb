user_solution = 'new text'


#
file_name = './mytext.txt'
text = File.read(file_name)
new_contents = text.gsub("$s", user_solution)
File.open(file_name, "w") {|file| file.puts new_contents }
#
