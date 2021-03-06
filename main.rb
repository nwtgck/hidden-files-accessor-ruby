require 'optparse'

opt = OptionParser.new

option = {}
opt.on('-c', '--check'){|v| option[:check] = v}
opt.on('-g', '--generate'){|v| option[:generate] = v}

opt.parse!(ARGV)

# Parent directory, which holds hidden files
DIR = ARGV[0]

if DIR.nil?
  puts("Usage: ruby main.rb <dir-path>")
  exit(1)
end

# Access directory name
ACCESS_DIR_NAME = 'hidden-access'

# Find all hidden files
hidden_file_names  = Dir.open(DIR).select{|n| n.start_with?('.') && n != '.' && n != '..'}

# Create access directory path
access_parent_path = File.join(DIR, ACCESS_DIR_NAME)

# If generating is enable
if option[:generate]
  # Create access directory if not exists
  if !File.exist?(access_parent_path)
    Dir.mkdir(access_parent_path)
  end
end

# Find MAX name length (for better print)
max_path_length = hidden_file_names.map{|n| File.join(DIR, n)}.max_by{|n| n.length}.length

hidden_file_names.each{|name|
  # Create hidden file path
  hidden_file_path = File.join(DIR, name)
  # Create name without '.'
  name_without_dot = name[1..-1]
  # Create symbolic new path
  new_path         = File.join(access_parent_path, name_without_dot)

  # If checking is enable
  if option[:check]
    # Create spaces for better print
    padding_space = ' ' * (max_path_length - hidden_file_path.length)
    # Print path
    puts("Check: #{hidden_file_path}#{padding_space} ->  #{new_path}")
  end


  # If generating is enable
  if option[:generate]
    # Create symbolic link if not exists
    if !File.exists?(new_path)
      File.symlink(hidden_file_path, new_path)
    end
  end
}

if option[:generate]
  puts("Generated!")
else
  puts("<Not generated>")
end
