<%--
  Created by IntelliJ IDEA.
  User: gimdonghyeon
  Date: 2018. 10. 30.
  Time: PM 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>길빵충알림E</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=JOC6PQf2Bk0n6ETFpPte"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body style="align-content: center;padding-left: 20%;padding-top: 10%;">
<div id="map" style="width:80%;height:400px;"></div>
    <script>
        //지도 추가
        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.451084, 126.656507),
            zoom: 13
        });
        var marker_x=new Array();
        var marker_y=new Array();
        var nicotin=new Array();
        var markers = [],
            infoWindows = [];
        //순서맞추기 위한 임시 값
        markers.push(0);
        infoWindows.push(0);
        marker_x.push(0);
        marker_y.push(0);
        nicotin.push(0);
        <c:forEach items="${list }" var="row">
        marker_x.push(${row.point_x });
        marker_y.push(${row.point_y });
        nicotin.push(${row.nicotin});
        </c:forEach>
        var dust_value=36.5949821;
        var id_street=0;
        var smoking_person=0;
        var address="a";

        for(var i=1;i<marker_x.length;i++) {
            var position = new naver.maps.LatLng(marker_x[i],marker_y[i]);
            var marker = new naver.maps.Marker({
                position:position,
                map: map
            });
            mark.push(marker);
            var infoWindow = new naver.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:10px;">가로등 번호:1<br>미세먼지:10<br>니코틴:'+nicotin[i]+'</div>'
            });
            markers.push(marker);
            infoWindows.push(infoWindow);
        }
        naver.maps.Event.addListener(map, 'idle', function() {
            updateMarkers(map, markers);
        });
        
        function updateMarkers(map, markers) {

            var mapBounds = map.getBounds();
            var marker, position;

            for (var i = 0; i < markers.length; i++) {

                marker = markers[i]
                position = marker.getPosition();

                if (mapBounds.hasLatLng(position)) {
                    showMarker(map, marker);
                } else {
                    hideMarker(map, marker);
                }
            }
        }

        function showMarker(map, marker) {

            if (marker.setMap()) return;
            marker.setMap(map);
        }

        function hideMarker(map, marker) {

            if (!marker.setMap()) return;
            marker.setMap(null);
        }

        // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
        function getClickHandler(seq) {
            return function(e) {
                var marker = markers[seq],
                    infoWindow = infoWindows[seq];

                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker);
                }
            }
        }

        for (var i=0, ii=markers.length; i<ii; i++) {
            naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
        }
</script>
<div style="display: inline-block">
    선택 마커 주변 정보<br>
    미세먼지:<p class="dust"></p>
    주소:<p class="address"></p>
    가로등 번호:<p class="id_street"></p>
    흡연자 수:<p class ="smoking_person"></p>
</div>
</body>
</html>
