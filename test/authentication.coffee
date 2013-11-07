chai       = require 'chai'
expect     = chai.expect
assert     = chai.assert
should     = chai.should()

describe "Authentication", ->
	Authentication = require "../src/backless.authentication"
	Database       = require "../src/backless.db"
    
	it "should throw error if not instantiated with DB", ->
		expect(-> new Authentication).to.throw(Error)
        
	it "should be able to modify value before find", ->
        db   = new Database
        auth = new Authentication db
        
        auth.register 'George', 1234
        auth.allow 'George', [23]
        allowed = auth.authenticate 'George', 1234
        
        expect(allowed.fields[0]).to.equal 23