EventEmitter = require("events").EventEmitter
Collection   = require "./backless.collection"
_            = require "lodash"

class Database extends EventEmitter
	constructor: (options) ->
		@collections = []
		@_indexes    = {}

		@add '$users'
		@add '$groups'
		@add '$permissions'

	add: (collection, silent) ->
		index = @collections.length

		if not (collection instanceof Collection)
			collection = new Collection collection

		@emit "onBeforeAddCollection", collection

		@collections.push(collection)
		@_indexes[collection.id] = index

		@emit "onAddCollection", collection if not silent

		collection

	use: (id) ->
		@collections[@_indexes[id]]

	grant: (perm, group, field) ->
		perm = @find perm

	join: (col1, col2, joinOn, val) ->
		query = {}
		query[joinOn] = val

		c1 = @use col1 
		c2 = @use col2

		m1 = c1.findOne query
		m2 = c2.findOne query

		_.extend m1, m2


module.exports = Database