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


getConvertSettings = (req) ->
	if req.body.convert
		res = convertSettings[req.body.convert]
		res.input = req.body.input if req.body.input
		res.output = req.body.output if req.body.output
		res.args = req.body.args if req.body.args
		return res
	else
		convertSettings[defaultConvert]


module.exports.convert = (req, res) ->
	upload = req.files.upload

	settings = getConvertSettings(req)

	res.type(settings.output)

	cmd = "convert #{settings.input}:#{upload.path}[0] #{settings.args} #{settings.output}:-"

	exec cmd, execSettings, (error, stdout, stderr) ->
		res.send(new Buffer(stdout, 'binary'))
