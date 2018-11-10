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
<body style="align-content: center;padding-left: 20%;padding-top: 10%;">
<div id="map" style="width:80%;height:400px;"></div>
    <script>
        <%//response.setIntHeader("Refresh", 5);%>

        //지도 컨트롤 추가
        var map = new naver.maps.Map('map', {
            scaleControl: false,
            logoControl: false,
            mapDataControl: false,
            zoomControl: true,
            minZoom: 1,
            center: new naver.maps.LatLng(37.381712, 126.653436),
            zoom: 13
        });
        var MARKER_SPRITE_X_OFFSET = [],//위도
            MARKER_SPRITE_Y_OFFSET = [],//경도
            MARKER_SPRITE_POSITION = [],//종합 위치정보
            MARKER_SPRITE_MISE=[],//미세먼지 농도
            MARKER_SPRITE_SMOKING_PEOPLE=[],//흡연 인원 수
            MARKER_SPRITE_NICOTIN =[],//니코틴 농도
            MARKER_SPRITE_PICTURE=[],//사진
            MARKER_SPRITE_CHO_MISE=[];//초미세먼지

        //가로등 번호 맞추기(1번부터 시작)
         MARKER_SPRITE_X_OFFSET.push(0);
         MARKER_SPRITE_Y_OFFSET.push(0);
         MARKER_SPRITE_POSITION.push(0);
         MARKER_SPRITE_MISE.push(0);
         MARKER_SPRITE_SMOKING_PEOPLE.push(0);
         MARKER_SPRITE_NICOTIN.push(0);
         MARKER_SPRITE_PICTURE.push(0);
        MARKER_SPRITE_CHO_MISE.push(0);

        <c:forEach items="${list}" var="row">//db에서 값 뽑아오기(1줄이 통째로 row에 들어감)
            var marker_position={ ${row.idx}:[${row.map_x},${row.map_y}]};
        MARKER_SPRITE_POSITION.push(marker_position);
        MARKER_SPRITE_X_OFFSET.push(${row.map_x});
        MARKER_SPRITE_Y_OFFSET.push(${row.map_y});
        MARKER_SPRITE_MISE.push(${row.dust10});
        MARKER_SPRITE_SMOKING_PEOPLE.push(${row.smoker});
        MARKER_SPRITE_NICOTIN.push(${row.nicotin});
        MARKER_SPRITE_PICTURE.push(${row.picture});
        MARKER_SPRITE_CHO_MISE.push(${row.dust25});
        </c:forEach>
        $('.tmp').text(MARKER_SPRITE_POSITION.length);
       var markers = [],
            infoWindows = [];

        for (var key in MARKER_SPRITE_POSITION) {

            var position = new naver.maps.LatLng(
                MARKER_SPRITE_X_OFFSET[key],
                MARKER_SPRITE_Y_OFFSET[key]);
            /*var icon;
            if(MARKER_SPRITE_SMOKING_PEOPLE>0){
                icon={
                    content: [
                        '<div class="cs_mapbridge">',
                        '<div class="map_group _map_group crs">',
                        '<div class="map_marker _marker num1 num1_big"> ',
                        '<span class="ico _icon"></span>',
                        '<span class="shd"></span>',
                        '</div>',
                        '</div>',
                        '</div>'
                    ].join('')
            }
            else
                icon= {
                    content: [
                        '<div class="cs_mapbridge">',
                        '<div class="map_group _map_group">',
                        '<div class="map_marker _marker tvhp tvhp_big">',
                        '<span class="ico _icon"></span>',
                        '<span class="shd"></span>',
                        '</div>',
                        '</div>',
                        '</div>'
                    ].join('')
                }
*/
            var marker = new naver.maps.Marker({
                map: map,
                position: position,
                title: key,
                zIndex: 100,
            });
            var infoWindow = new naver.maps.InfoWindow({
                content: '<div style="font-size:13px; width:200px;height: 200px;text-align:left;padding:10px;">' +
                    '가로등 번호 <b>"'+ key +'"</b><br>' +
                    '미세먼지 농도:<b>"'+MARKER_SPRITE_MISE[key]+'"</b>ppm<br>' +
                    '초미세먼지 농도:<b>"'+MARKER_SPRITE_CHO_MISE[key]+'"</b>ppm<br>' +
                    '흡연자 수:<b>"'+MARKER_SPRITE_SMOKING_PEOPLE[key]+'"</b>명<br>' +
                    '니코틴 농도:<b>"'+MARKER_SPRITE_NICOTIN[key]+'"</b>명<br>' +
                    '<img src="'+MARKER_SPRITE_PICTURE[key]+'" style="width: 30%;height: auto"/> </div>'
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

        for (var i=0, ii=markers.length; i<ii; i++) {
            naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
        }
</script>
</body>
</html>
