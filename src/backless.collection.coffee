fs     = require 'fs'
UUID   = require 'node-uuid'
Schema = require './backless.schema'
EventEmitter = require("events").EventEmitter

class Collection extends EventEmitter
	models:   []
	_indexes: {}

	constructor: (name, options)->
		@name = name

		if options
			{@id} = options

		if not @id
			@id = UUID.v1()

	add: (model) ->
		@emit "onBeforeAdd", model

		if model isnt {}
			length = @models.length
			@models.push model
			@_indexes[model.id] = length

			@emit "onAfterAdd", model

		@

	find: (index) ->
		models = []

		if typeof index is 'object'
			spec = index

			for mod in @models
				matches = 0
				total   = Object.keys(spec).length

				for attr, val in spec
					break if col[attr] isnt val

					models.push col
					matches++

				models.push col if matches is total

			if models.length is 1
				models = models[0]

		else
			models = @models[@_indexes[index]]

		@emit "onBeforeDeliver", models

		models

module.exports = Collection