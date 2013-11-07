class Authentication
	constructor: (db) ->
		if db
			@db = db
		else 
            throw new Error "Authentication must be instantiated with Database"
        
        @users = db.add "$users"
        @perms = db.add "$permissions"
        
	register: (user, pass) ->
		@users.add user: user, pass: pass

	authenticate: (user, pass) ->
        @db.join "$users", "$permissions", user: user, pass: pass
            
    allow: (user, fields) ->
        @perms.add user_id: user, fields: fields
         
module.exports = Authentication