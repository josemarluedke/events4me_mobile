Bootstrap = ->

	events = [
		{
			_id: 1, 
			name: "Fuubar", 
			description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
			min_age: 18, 
			place: {
				_id: 100,
				name: "Local event name",
				address: "Rua Fuubar Fuu Bar",
				number: "1208",
				complement: "",
				neighbourhood: "Neighbourhood",
				phone: "(51) 9918-5920",
				latitude: -51.234612,
				longitude: -30.53235
			}
		},{
			_id: 2, 
			name: "Fuubar", 
			description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
			min_age: 18, 
			place: {
				_id: 100,
				name: "Local event name",
				address: "Rua Fuubar Fuu Bar",
				number: "1208",
				complement: "",
				neighbourhood: "Neighbourhood",
				phone: "(51) 9918-5920",
				latitude: -51.234612,
				longitude: -30.53235
			}
		},{
			_id: 3, 
			name: "Fuubar", 
			description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
			min_age: 18, 
			place: {
				_id: 100,
				name: "Local event name",
				address: "Rua Fuubar Fuu Bar",
				number: "1208",
				complement: "",
				neighbourhood: "Neighbourhood",
				phone: "(51) 9918-5920",
				latitude: -51.234612,
				longitude: -30.53235
			}
		}
	]

	Ti.App.Properties.setList "events", events

module.exports = Bootstrap