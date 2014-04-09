readme.txt

The walk_tree module provides three functions:

1. walkTree - passed three args: dir, f_match, and f_visit

  dir - starting directory
  f_match - determine if file is one that is to be processed
  f_visit - function to be applied to file

  based on:
  http://rosettacode.org/wiki/Walk_a_directory/Recursively#CoffeeScript


2. copyTree - passed three args: dir_from, dir_to, f_match

  dir_from - copy from this directory
  dir_to - copy to this directory
  f_match - determine if file is one that is to be processed


3. walk - passed one argument: dir

  dir - starting directory

  based on python os.walk function, which returns a list of
  tuples with the following content: (dirname, dirs, files )

  dirname - absolute path to directory
  dirs - array of sub-directories (directory name only)
  files - array of files in dirname (file name only)