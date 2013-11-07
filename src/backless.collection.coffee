fs     = require 'fs'
UUID   = require 'node-uuid'
_      = require 'lodash'
Schema = require './backless.schema'
EventEmitter = require("events").EventEmitter

class Collection extends EventEmitter
	constructor: (name, options)->

		@models   = []
		@_indexes = {}

		if name instanceof Object
			options = name
		else @name = name

		if options
			{@id} = options

		if not @id
			@id = UUID.v1()

	add: (model) ->
		@emit "onBeforeAdd", model

		if model isnt {}
			index = @models.length
			@models.push model
			@_indexes[model.id] = index

			@emit "onAfterAdd", model

		@

	find: (index) ->
		models = []

		if index instanceof Object
			spec = index

			for mod in @models

				for attr in _.keys spec
					break if mod[attr] isnt spec[attr]
					models.push mod

			if models.length is 1
				models = models[0]

		else
			models = @models[@_indexes[index]]

		found = _.clone(models)

		@emit "onBeforeFind", found

		return found

	findOne: (index) ->
		models = @find index

		if models instanceof Array
			models[0]
		else 
			models

module.exports = Collection