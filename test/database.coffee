chai   = require 'chai'
expect = chai.expect
assert = chai.assert
should = chai.should

describe "Database", ->
	Database = require '../src/backless.db'

	it "should be instantiated with group related collections", ->
		db          = new Database
		users       = db.get "$users"
		groups      = db.get "$groups"
		permissions = db.get "$permissions"

		expect(users).to.be.an 'object'
		expect(groups).to.be.an 'object'
		expect(permissions).to.be.an 'object'

	it "should require a user/group session to query", ->
		db = new Database

		noSessionQuery = ->
			false

		sessionQuery = ->
			true

		expect(noSessionQuery()).to.equal false
		expect(sessionQuery()).to.equal true