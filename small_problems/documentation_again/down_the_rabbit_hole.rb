require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.

# Std-lib 1.8.6
# "Load a document from the file located at filepath"
# load_file(filepath)

# Std-lib 2.6.3
# YAML module is an alias of Psych
# Psych#load_file - "Load the document contained in filename"
# load_file(filename, fallback: false)


