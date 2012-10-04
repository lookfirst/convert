express = require('express')
converter = require('./lib/converter')

app = express()
	.use(express.logger())
	.use(express.favicon())
	.use(express.bodyParser())
	.use(express.static(__dirname + '/public'))

auth = express.basicAuth (u,p) ->
	u == 'nixon' && p == '@#$jfiehd1'

app.get '/', (req, res) ->
	res.redirect('/upload.html')

app.post '/', auth, (req, res) ->
	converter.convert(req, res)


port = process.env.PORT || 5000
app.listen port, ->
	console.log("Listening on " + port)