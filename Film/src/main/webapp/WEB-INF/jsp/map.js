var map = L.map('map').setView([-18,48], 6);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

var control = L.Routing.control({
    waypoints: [
        null
    ],
    routeWhileDragging: true
}).addTo(map);

var counter = 0;
map.on('click', function(e) {
    counter++;  
    if(counter == 2) {
        control.spliceWaypoints(control.getWaypoints().length - 1, 1, e.latlng);
        control.on('routesfound', function(e) {
            var route = e.routes[0];
            var distance = route.summary.totalDistance;
            let data = {
                point1 : control.getWaypoints()[0].latLng,
                point2 : control.getWaypoints()[1].latLng,
                dist : distance
            }

            console.log(data);
            // sendData(JSON.stringify(data))
            // alert('Distance: ' +  + ' meters');
        });
        counter = 0;
    }
    if(counter == 1) {
        control.spliceWaypoints(0, 1, e.latlng);
    }
});

// function sendData(data){
//     let xhr = new XMLHttpRequest();
//     xhr.open("POST", "http://localhost:8000/map/calculate",true);
//     xhr.send(data)
// }