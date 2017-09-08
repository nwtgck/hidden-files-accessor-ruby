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

# Create access directory if not exists
if !File.exist?(access_parent_path)
  Dir.mkdir(access_parent_path)
end


hidden_file_names.each{|name|
  # Create hidden file path
  hidden_file_path = File.join(DIR, name)
  # Create name without '.'
  name_without_dot = name[1..-1]
  # Create symbolic new path
  new_path         = File.join(access_parent_path, name_without_dot)

  # Create symbolic link if not exists
  if !File.exists?(new_path)
    File.symlink(hidden_file_path, new_path)
  end
}
