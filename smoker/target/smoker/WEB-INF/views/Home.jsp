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
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=JOC6PQf2Bk0n6ETFpPte"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body style="align-content: center;padding-left: 20%;padding-top: 10%;">
<div id="map" style="width:80%;height:400px;"></div>
<c:forEach items="${list }" var="row">
</c:forEach>
    <script>
        var dust_value=0;
        var id_street=0;
        var smoking_person=0;
        var address="a";
    //후문 정보창
    var gate = new naver.maps.LatLng(37.451084, 126.656507),
        map = new naver.maps.Map('map', {
            center: gate.destinationPoint(0, 0),
            zoom: 12
        }),
        marker = new naver.maps.Marker({
            map: map,
            position: gate
        });

    var contentString = ['후문담배길빵 ㄴㄴ'].join('');

    var infowindow = new naver.maps.InfoWindow({
        content: contentString
    });

    naver.maps.Event.addListener(marker, "click", function(e) {
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
            infowindow.open(map, marker);
            $('.dust').text("aaaaaaaa");
            $('.id_street').text("aaaaaaaaaa");
            $('.smoking_person').text("aaaaaaaa");
            $('.address').text("aaaaaaaa");
        }
    });

    infowindow.open(map, marker);

    //5호관 60주년 사이
    var five = new naver.maps.LatLng(37.450897, 126.653963);
    var marker_5ho = new naver.maps.Marker({
        map: map,
        position: five
    });

    var contentString_5ho = ['5호오오오오오과아아안'].join('');

    var infowindow_5ho = new naver.maps.InfoWindow({
        content: contentString_5ho
    });

    naver.maps.Event.addListener(marker_5ho, "click", function(e) {
        if (infowindow_5ho.getMap()) {
            infowindow_5ho.close();
        } else {
            infowindow_5ho.open(map, marker_5ho);
            $('.dust').text(dust_value);
            $('.id_street').text(id_street);
            $('.smoking_person').text(smoking_person);
            $('.address').text(address);
        }
    });

    infowindow_5ho.open(map, marker_5ho);
    //하택 저층부 입구
    var hatak = new naver.maps.LatLng(37.450428, 126.657686);
    var marker_hatak = new naver.maps.Marker({
        map: map,
        position: hatak
    });

    var contentString_hatak = ['하으아아아택'].join('');

    var infowindow_hatak = new naver.maps.InfoWindow({
        content: contentString_hatak
    });

    naver.maps.Event.addListener(marker_hatak, "click", function(e) {
        if (infowindow_hatak.getMap()) {
            infowindow_hatak.close();
        } else {
            infowindow_hatak.open(map, marker_hatak);
            $('.dust').text("bbbbbbb");
            $('.id_street').text("bbbbbbbb");
            $('.smoking_person').text("bbbbbbb");
            $('.address').text("bbbbbbb");
        }
    });

    infowindow_hatak.open(map, marker_hatak);

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
