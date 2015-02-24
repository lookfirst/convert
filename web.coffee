express = require('express')
formidable = require('formidable')
morgan = require('morgan')
favicon = require('serve-favicon')
serveStatic = require('serve-static')
auth = require('http-auth')
bodyParser = require('body-parser')

converter = require('./lib/converter')

basic = auth.basic({realm: "Convert"}, (u, p, cb) ->
	cb(u == 'nixon' && p == '@#$jfiehd1')
)

multerConfig = {}
if process.env.NODE_ENV == 'production'
	multerConfig = {dest: '/var/tmp'}

app = express()
	.use(morgan('combined'))
	.use(favicon(__dirname + '/public/favicon.ico'))
	.use(multer(multerConfig))
	.use(bodyParser.json())
	.use(bodyParser.urlencoded({ extended: false }))
	.use(serveStatic(__dirname + '/public'))

app.get '/', auth.connect(basic), (req, res) ->
	res.redirect('/upload.html')

app.post '/', auth.connect(basic), (req, res) ->
	converter.convert(req, res)


port = process.env.PORT || 5000
app.listen port, ->
	console.log("Listening on " + port)