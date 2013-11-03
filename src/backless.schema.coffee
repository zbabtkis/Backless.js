Field = require './backless.field'

class Schema
	constructor: (fields)->
		@fields = []
		@_indexes = {}

		@addField field for field in fields

	addField: (field) ->
		field = new Field field
		index = @fields.length

		@fields.push field
		@_indexes[field.name] = index

		@

	validate: (model) -> 
		safeModel = {}

		for key in Object.keys model  when key in Object.keys @_indexes
			TypeCaster = @fields[@_indexes[key]].type
			value = model[key]

			safeModel[key] = TypeCaster value

		safeModel

module.exports = Schema