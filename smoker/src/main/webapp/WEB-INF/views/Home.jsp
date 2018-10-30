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

</head>
<body>
<div id="map" style="width:80%;height:400px;"></div>

<script>
    var mapOptions = {
        center: new naver.maps.LatLng(37.451084, 126.656507),
        zoom: 13
    };

    var map = new naver.maps.Map('map', mapOptions);

    var marker = new naver.maps.Marker({//후문
        position: new naver.maps.LatLng(37.451084, 126.656507),
        map: map
    });
    var marker = new naver.maps.Marker({//하텍 저층부
        position: new naver.maps.LatLng(37.450428, 126.657686),
        map: map
    });
    var marker = new naver.maps.Marker({//5호관, 60주년 사이
        position: new naver.maps.LatLng(37.450897, 126.653963),
        map: map
    });

</script>
</body>
</html>
