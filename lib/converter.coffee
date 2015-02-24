exec = require('child_process').exec

execSettings = {encoding: 'binary', maxBuffer: 100000*1024}

defaultConvert = 'pdf:png'

convertSettings =
	'pdf:jpg':
		'input': 'pdf'
		'output': 'jpg'
		'args': '-density 600'
	'pdf:png':
		'input': 'pdf'
		'output': 'png'
		'args': '-density 600'
	'pdf:png-thumb':
		'input': 'pdf'
		'output': 'png'
		'args': '-depth 4 -resize 173 -quality 80 -strip'


getConvertSettings = (req) ->
	b = req.body
	if b.convert
		res = convertSettings[b.convert]
		res.input = b.input if b.input
		res.output = b.output if b.output
		res.args = b.args if b.args
		return res
	else
		convertSettings[defaultConvert]


exports.convert = (req, res) ->
	upload = req.files.upload

	console.log(upload)

	settings = getConvertSettings(req)

	res.type(settings.output)

	cmd = "convert #{settings.input}:#{upload.path}[0] #{settings.args} #{settings.output}:-"

	exec(cmd, execSettings, (error, stdout, stderr) ->
		res.send(new Buffer(stdout, 'binary'))
	)