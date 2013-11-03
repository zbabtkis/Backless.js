EventEmitter = require("events").EventEmitter
Collection   = require './backless.collection'

class Database extends EventEmitter
	constructor: (options) ->
		@collections = []
		@_indexes    = {}

		@add '$users', true
		@add '$groups', true
		@add '$permissions', true
		@add '$fields', true

	add: (collection, silent) ->
		index = @collections.length

		@emit "onBeforeAddCollection", collection

		if collection isnt {}

			@collections.push(collection)
			@_indexes[collection.id] = index

			@emit "onAddCollection", collection if not silent

		collection

	use: (id) ->
		@collections[@_indexes[id]]

	grant: (perm, group, field) ->
		perm = @find perm


module.exports = Database