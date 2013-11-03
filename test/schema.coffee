chai       = require 'chai'
expect     = chai.expect
assert     = chai.assert

describe "Schema", ->
	Schema = require '../src/backless.schema'

	it "Should initialize with fields", ->
		schema = new Schema [
			{
				name: 'title',
				type: String
			},
			{
				name: 'body',
				type: String
			}

		]

		expect(schema.fields.length).to.equal 2

	it "Should set value to null for invalid Number type", ->
		schema = new Schema [
			{
				name: 'age',
				type: Number
			}
		]

		badValue = schema.validate
			age: '23hello'

		assert.isNumber(badValue.age)

	it "Should set value correctly for correct type", ->
		schema = new Schema [
			{
				name: 'body',
				type: String
			}
		]

		goodValue = schema.validate
			body: 'Hello'

		assert.isString(goodValue.body)
		assert.equal(goodValue.body, 'Hello')