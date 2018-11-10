<%--
  Created by IntelliJ IDEA.
  User: gimdonghyeon
  Date: 2018. 10. 30.
  Time: PM 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
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
<body style="display: inline-block; margin-left: 15%">
<img src="images/label.png" width="90%" height="17%"><img>
<br><br><br><br>
<div>
    <span style=" width:20%;display: inline-block;">
        <a href="#"><img src="images/menu2.png" width="60%" height="15%" style="margin-left: 13%" onclick="visible_circle()"/></a><br><br>
        <a href="#"><img src="images/menu.png" width="60%" height="15%"style="margin-left: 13%; margin-bottom: 53px" onclick="unvisible_circle()"/></a></span>
    <span id="map" style="width:60%;height:50%;
    align-content: center; display:inline-block;">
    <script>
        <%//response.setIntHeader("Refresh", 5);%>

        //지도 컨트롤 추가
        var map = new naver.maps.Map('map', {
            scaleControl: false,
            logoControl: false,
            mapDataControl: false,
            zoomControl: true,
            minZoom: 1,
            center: new naver.maps.LatLng(37.382147, 126.655571),
            zoom: 13
        });
        //수치 표기용 지도
        var MARKER_SPRITE_X_OFFSET = [],//위도
            MARKER_SPRITE_Y_OFFSET = [],//경도
            MARKER_SPRITE_POSITION = [],//종합 위치정보
            MARKER_SPRITE_MISE=[],//미세먼지 농도
            MARKER_SPRITE_SMOKING_PEOPLE=[],//흡연 인원 수
            MARKER_SPRITE_PICTURE=[],//사진
            MARKER_SPRITE_CHO_MISE=[],//초미세먼지
            MARKER_SPRITE_DEVICE=[];//기계번호

        //가로등 번호 맞추기(1번부터 시작)
         MARKER_SPRITE_X_OFFSET.push(0);
         MARKER_SPRITE_Y_OFFSET.push(0);
         MARKER_SPRITE_POSITION.push(0);
         MARKER_SPRITE_MISE.push(0);
         MARKER_SPRITE_SMOKING_PEOPLE.push(0);
         MARKER_SPRITE_PICTURE.push("a");
         MARKER_SPRITE_CHO_MISE.push(0);
         MARKER_SPRITE_DEVICE.push(0);
        <c:forEach items="${list}" var="row">//db에서 값 뽑아오기(1줄이 통째로 row에 들어감)
            var marker_position={ ${row.device}:[${row.map_x},${row.map_y}]};
        MARKER_SPRITE_POSITION.push(marker_position);
        MARKER_SPRITE_X_OFFSET.push(${row.map_x});
        MARKER_SPRITE_Y_OFFSET.push(${row.map_y});
        MARKER_SPRITE_MISE.push(${row.dust10});
        MARKER_SPRITE_SMOKING_PEOPLE.push(${row.smoker});
        MARKER_SPRITE_PICTURE.push("${row.picture}");
        MARKER_SPRITE_CHO_MISE.push(${row.dust25});
        MARKER_SPRITE_DEVICE.push(${row.device})
        </c:forEach>
            var markers = [],
            infoWindows = [];
        var greenMarker = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.3613962, 127.1112487),
            map: map,
            title: 'Green',
            icon: {
                content: [//
                    '<circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />'
                ].join(''),
                size: new naver.maps.Size(38, 58),
                anchor: new naver.maps.Point(19, 58),
            },
            draggable: true
        });
        for (var key=1 in MARKER_SPRITE_POSITION) {

            var position = new naver.maps.LatLng(
                MARKER_SPRITE_X_OFFSET[key],
                MARKER_SPRITE_Y_OFFSET[key]);

            var marker = new naver.maps.Marker({
                map: map,
                position: position,
                zIndex: 14

            });

            var infoWindow = new naver.maps.InfoWindow({
                content: '<div style="font-size:13px; width:200px;height: 150px;text-align:left;padding:10px;">' +
                    '미세먼지 농도:<b>"'+MARKER_SPRITE_MISE[key]+'"</b>ppm<br>' +
                    '초미세먼지 농도:<b>"'+MARKER_SPRITE_CHO_MISE[key]+'"</b>ppm<br>' +
                    '흡연자 수:<b>"'+MARKER_SPRITE_SMOKING_PEOPLE[key]+'"</b>명<br>' +
                    '<img src="images/'+MARKER_SPRITE_PICTURE[key]+'" style="width: 100%;height: 80px"/> </div>'
            });

            markers.push(marker);
            infoWindows.push(infoWindow);
        };

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
        var circles=new Array();
        //가짜 값
        function visible_circle() {
            circles.push(0);
            for (var i=0, ii=markers.length; i<ii; i++) {
                var position_1 = new naver.maps.LatLng(
                    MARKER_SPRITE_X_OFFSET[i],
                    MARKER_SPRITE_Y_OFFSET[i]);
                var circle = new naver.maps.Circle({
                    strokeColor: '#000000',
                    strokeOpacity: 0,
                    strokeWeight: 1,
                    fillColor: '#000000',
                    fillOpacity: 0.3,
                    center: position_1,
                    radius: MARKER_SPRITE_SMOKING_PEOPLE[i]*5,
                    zIndex: 100,
                    clickable: true,
                    map: map
                });
                circles.push(circle);
            }
        }
        function unvisible_circle() {
            window.location.reload()
        }
        for (var i=0, ii=markers.length; i<ii; i++) {
            naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
        }
</script>
    </span>
</div>
</body>
</html>
