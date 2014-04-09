#copy_tree.coffee

fs = require('fs')
path = require('path')


#---------  helper functions ----------------
abspath = (fn) ->
	return path.resolve(__dirname, fn)

copyFileSync = (path_from, path_to) ->
	data = fs.readFileSync(path_from)
	fs.writeFileSync(path_to,data)
	return null


#-----------  exported functions ----------------------

#walkTreeSync based on:
#http://rosettacode.org/wiki/Walk_a_directory/Recursively#CoffeeScript

walkTreeSync = (dir, f_match, f_visit) ->
  _walk_tree = (dir) ->
    fns = fs.readdirSync dir
    for fn in fns
      fn = path.join(dir,fn)
      if f_match fn
        try
          f_visit fn
        catch err
          console.log "error visiting #{fn}"
          throw err
      if fs.statSync(fn).isDirectory()
        _walk_tree fn
    return null
    
  _walk_tree(dir)



copyTreeSync = (dir_from, dir_to, f_match) ->

	if fs.existsSync(dir_to) isnt true 
		fs.mkdirSync dir_to

	fns = fs.readdirSync dir_from		
	for fn in fns
		path_from = path.join(dir_from, fn)
		path_to = path.join(dir_to, fn)

		if fs.statSync(path_from).isDirectory()
			console.log 'copying dir ' + path_from + ' to ' + path_to
			fs.mkdirSync path_to
			copyTreeSync path_from, path_to, f_match

		else if f_match(fn)
			try
					console.log 'copying ' + path_from + ' to ' + path_to
					copyFileSync(path_from, path_to)
			catch e
				console.log 'Error creating ' + path_to + ' --skipped'

	return null






# walkSync based on python os.walk function, which returns a list of
# tuples with: (dirname, dirs, files )


walkSync = (dir) ->
  dir_list = []
  _walk = (dir) ->
    fns = fs.readdirSync dir
    dirs = []
    files = []
    dirname = abspath(dir)
    list_item = [dirname, dirs, files]
    for fn in fns
      path_fn = path.join(dirname, fn)
      if fs.statSync(path_fn).isDirectory()
        dirs.push(fn)
        _walk(path_fn)
      else
        files.push(fn)

    dir_list.push(list_item)
    return null
    
  _walk(dir)

  return dir_list




module.exports = {
	copyTreeSync
	walkTreeSync
  walkSync
}

