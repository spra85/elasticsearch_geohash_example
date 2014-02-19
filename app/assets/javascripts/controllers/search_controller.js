(App.Controllers.Search = {
  defaultCenter: [39.375, -77.34375],
  defaultZoom: 3,
  popup: L.popup(),
  polygons: L.layerGroup(),

  initialize: function() {
    if ($(".search-controller").length > 0) this.initMap();
  },

  initMap: function() {
    _.bindAll(this, "handleMapClick");
    this.map = L.map("map").setView(this.defaultCenter, this.defaultZoom);
    this.addOpenStreetMapLayer();
    this.addPolygonLayerGroup();
    this.initEventHandlers();
  },

  addGoogleMapLayer: function() {
    this.map.addLayer(new L.Google("ROADMAP"));
  },

  addOpenStreetMapLayer: function() {
    L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
      maxZoom: 18,
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
    }).addTo(this.map);
  },

  addPolygonLayerGroup: function() {
    this.polygons.addTo(this.map);
  },

  initEventHandlers: function() {
    //this.map.on("click", this.handleMapClick);
  },

  handleMapClick: function(event) {
    this.popup.setLatLng(event.latlng).setContent("You clicked the map at " + event.latlng.toString()).openOn(this.map);
  },

  addGridData: function(geoData) {
    var _this = this;
    _.each(geoData, function(gridObject){
      _this.addPolygon(gridObject);
    });
  },

  addPolygon: function(gridObject) {
    var _this = this;
    var polygon = L.polygon(gridObject.coordinates);
    debugger

    polygon.on("click", function(event) {
      _this.popup.setLatLng(event.latlng).setContent("Border contains " + gridObject.count + " zip codes").openOn(_this.map);
    });
    this.polygons.addLayer(polygon);
  }
}).initialize();
