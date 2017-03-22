<h2 class="">{{ $options['title'] }}</h2>
<div class="gmap">
    <div id="map"></div>
</div>

<style>
    #map {
        height: {{ empty($options['height']) ? "100%" : $options['height']."px" }};
        width: {{ empty($options['width']) ? "100%" : $options['width']."px" }};
    }
</style>
<script>
    function initMap() {
        var myLatLng = {lat: {{ $options['latitude'] or -25.363 }}, lng: {{$options['longitude'] or 131.044}} };

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: {{$options['zoom'] or 7}},
            center: myLatLng
        });

        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: "{{$options['title']}}"
        });
    }
</script>
<script async defer
        src="{{ "https://maps.googleapis.com/maps/api/js?key={$options['api_key']}&callback=initMap" }}">
</script>