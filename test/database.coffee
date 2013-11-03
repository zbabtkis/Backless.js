chai       = require 'chai'
expect     = chai.expect
assert     = chai.assert
should     = chai.should()
sinon      = require 'sinon'

describe "Database", ->
	Database = require '../src/backless.db'

	it "should return collection when adding collection", ->
		db = new Database
		myCol = db.add id: 'myCol'

		expect(myCol).to.be.an('object')

	it "should emit collection:add event when adding collection", ->
		spy = sinon.spy()
		db = new Database

		db.on 'onAddCollection', spy
		db.add id: 'Users'

		expect(spy.called)

	it "should add new collection to @collections", ->
		db = new Database
		oldLen = db.collections.length
		db.add id: 'myCol'

		expect(db.collections.length).to.equal(oldLen + 1)

	it "should retrieve collection by id", ->
		db = new Database
		db.add id: 'myCol'

		col = db.use 'myCol'

		expect(col.id).to.equal 'myCol'



