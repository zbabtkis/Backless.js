var Backbone   = require('backbone');

var Database = Backbone.Collection.extend({
	initialize: function() {
		this.add([
			{id: "$users"}
		  , {id: "$groups"}
		  , {id: "$permissions"}
		]);
	}
});

var DBFactory = function(options) {
	return new Database([], options);
}


module.exports = DBFactory;