class Authentication
	constructor: (db) ->
		@db = db

	registerClient: (user, pass) ->
		users = db.use '$users'
		user  = users.find user: user, pass: pass
		db.on 'onBeforeDeliver', (model, field) ->
			@authenticate model, field, user

	authenticate: (model, user) ->
