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
        var mark=new Array();
        var marker_x=new Array();
        var marker_y=new Array();
        var nicotin=new Array();
        //순서맞추기 위한 임시 값
        mark.push(0);
        marker_x.push(0);
        marker_y.push(0);
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
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(marker_x[i], marker_y[i]),
                map: map
            });
            mark.push(marker);
        }
        var m;
        for(m=1;m<marker_x.length;m++){
            var tmp=marker_x[m];
            naver.maps.Event.addListener(mark[m], "click", function(t) {
                $('.address').text(tmp);
            });
        }
        m=0;
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
