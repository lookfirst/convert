express = require('express')
multer  = require('multer')
morgan = require('morgan')
bodyParser = require('body-parser')
favicon = require('serve-favicon')
serveStatic = require('serve-static')
auth = require('http-auth')

converter = require('./lib/converter')

basic = auth.basic({realm: "Convert"}, (u, p, cb) ->
	cb(u == 'nixon' && p == '@#$jfiehd1')
)

app = express()
	.use(morgan('combined'))
	.use(favicon(__dirname + '/public/favicon.ico'))
	.use(bodyParser.urlencoded({ extended: false }))
	.use(bodyParser.json())
	.use(multer())
	.use(serveStatic(__dirname + '/public'))

app.get '/', auth.connect(basic), (req, res) ->
	res.redirect('/upload.html')

app.post '/', auth.connect(basic), (req, res) ->
	converter.convert(req, res)


port = process.env.PORT || 5000
app.listen port, ->
	console.log("Listening on " + port)