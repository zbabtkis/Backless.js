chai       = require 'chai'
expect     = chai.expect
assert     = chai.assert

describe "Collection", ->
	Collection = require '../src/backless.collection'

	it "should set name with name from constructor options", ->
		myCol = new Collection 123

		assert.equal myCol.name, 123

	it "should add model without schema", ->
		myCol = new Collection 123

		myCol.add
			name: 'Zack'
			age: 23

		expect(myCol.models.length).to.equal(1)

	it "should fire onBeforeAdd event before adding to collection", (done)->
		myCol = new Collection "myCol"

		myCol.on 'onBeforeAdd', (model) ->
			model.id = 123

		myCol.on 'onBeforeAdd', (model) ->
			assert.equal(model.id, 123)
			done()

		myCol.add
			name: 'Zack'

	it "should fire onAfterAdd when done adding model", (done) ->
		myCol = new Collection "myCol"

		myCol.on "onAfterAdd", ->
			done()

		myCol.add
			name: "Zack"

	it "should be able to find model by id", ->
		myCol = new Collection 123

		myCol.add
			name: 'Zack',
			id: 32

		model = myCol.find 32

		assert.equal model.name, 'Zack'