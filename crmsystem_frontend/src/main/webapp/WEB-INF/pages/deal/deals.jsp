
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <link rel="stylesheet/less" type="text/css" href="/resources/css/style.less"/>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.0/less.min.js"></script>

  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.2.min.js" ></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


  <!-- Styles -->
  <style>
    #chartdiv {
      width	: 100%;
      height	: 500px;
    }
  </style>

  <!-- Resources -->
  <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
  <script src="https://www.amcharts.com/lib/3/serial.js"></script>
  <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
  <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
  <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
  <script src="http://amcharts/plugins/dataloader/dataloader.min.js" type="text/javascript"></script>
  <title>Deals</title>

</head>

<body>

<jsp:include page="../menuPices/navbarLeft.jsp"/>
<div class="main-content">
<h1>Deal list</h1>

<br>
<a href="<c:url value='/deal/add/' />" class="btn btn-lg" style="color: green"><i class="fa fa-plus"></i> Create deal</a>
<br>

<c:if test="${!empty listDeals}">
  <table>
    <tr>
      <th width="80">ID</th>
      <th width="120">NAME</th>
      <th width="120">BUDGET</th>
      <th width="120">ASSOCIATED CONTACT</th>
      <th width="120">CREATED</th>
      <th width="120">UPDATED</th>
      <th width="120">USER ID</th>
      <th width="120">DEAL STATUS</th>
      <th width="120">DELETE</th>
      <th width="120">EDIT</th>
    </tr>
    <c:forEach items="${listDeals}" var="deal">
      <tr align="center">
        <td>${deal.id}</td>
        <td>${deal.name}</td>
        <td>${deal.budget}</td>
        <td><c:forEach items="${deal.associatedContact}" var="contact">
          <table>
            <td>${contact.name}</td>
          </table>
        </c:forEach></td>
        <td>${deal.created}</td>
        <td>${deal.updated}</td>
        <td>${deal.responsibleUser.firstName}</td>
        <td>${deal.dealStatus.name}</td>
        <td><a href="<c:url value='/removedeal/${deal.id}/'/>">Delete</a></td>

        <td><a href="<c:url value='/editdeal/${deal.id}/'/>">Edit</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



  <!-- Chart code -->
  <script>

    var chart = AmCharts.makeChart("chartdiv", {
      "type": "serial",
      "theme": "light",
      "marginTop":0,
      "marginRight": 80,
      "categoryField": "Date",
      "dataLoader": {
        "url": "/dealDataJson",
        "format": "json",
      },
      "valueAxes": [{
        "axisAlpha": 0,
        "position": "left"
      }],
      "graphs": [{
        "id":"g1",
        "balloonText": "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>",
        "bullet": "round",
        "bulletSize": 8,
        "lineColor": "#d1655d",
        "lineThickness": 2,
        "negativeLineColor": "#637bb6",
        "type": "smoothedLine",
        "valueField": "budget"
      }],
      "chartScrollbar": {
        "graph":"g1",
        "gridAlpha":0,
        "color":"#888888",
        "scrollbarHeight":55,
        "backgroundAlpha":0,
        "selectedBackgroundAlpha":0.1,
        "selectedBackgroundColor":"#888888",
        "graphFillAlpha":0,
        "autoGridCount":true,
        "selectedGraphFillAlpha":0,
        "graphLineAlpha":0.2,
        "graphLineColor":"#c2c2c2",
        "selectedGraphLineColor":"#888888",
        "selectedGraphLineAlpha":1

      },
      "chartCursor": {
        "categoryBalloonDateFormat": "YYYY",
        "cursorAlpha": 0,
        "valueLineEnabled":true,
        "valueLineBalloonEnabled":true,
        "valueLineAlpha":0.5,
        "fullWidth":true
      },
      "dataDateFormat": "M d, yyyy kk.mm.ss a",
      "categoryField": "created",
      "categoryAxis": {
        "minPeriod": "MM",
        "parseDates": true,
        "minorGridAlpha": 0.1,
        "minorGridEnabled": true
      },
      "export": {
        "enabled": true
      }
    });

    chart.addListener("rendered", zoomChart);
    if(chart.zoomChart){
      chart.zoomChart();
    }
  </script>

  <!-- HTML -->
  <div id="chartdiv"></div>
</div>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
