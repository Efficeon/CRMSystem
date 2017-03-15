/**
 * Created by lion on 12.03.17.
 */
var chart = AmCharts.makeChart("chartdiv", {
    "type": "serial",
    "theme": "light",
    "marginTop":0,
    "marginRight": 80,
    "dataProvider": [{
        "created": "1950",
        "value": -0.307
    }, {
        "created": "1951",
        "value": -0.168
    }, {
        "created": "1952",
        "value": -0.073
    }, {
        "created": "1953",
        "value": -0.027
    }, {
        "created": "1954",
        "value": -0.251
    }, {
        "created": "1955",
        "value": -0.281
    }, {
        "created": "1956",
        "value": -0.348
    }, {
        "created": "1957",
        "value": -0.074
    }, {
        "created": "1958",
        "value": -0.011
    }, {
        "created": "1959",
        "value": -0.074
    }, {
        "created": "1960",
        "value": -0.124
    }, {
        "created": "1961",
        "value": -0.024
    }, {
        "created": "1962",
        "value": -0.022
    }, {
        "created": "1963",
        "value": 0
    }, {
        "created": "1964",
        "value": -0.296
    }, {
        "created": "1965",
        "value": -0.217
    }, {
        "created": "1966",
        "value": -0.147
    }, {
        "created": "1967",
        "value": -0.15
    }, {
        "created": "1968",
        "value": -0.16
    }, {
        "created": "1969",
        "value": -0.011
    }, {
        "created": "1970",
        "value": -0.068
    }, {
        "created": "1971",
        "value": -0.19
    }, {
        "created": "1972",
        "value": -0.056
    }, {
        "created": "1973",
        "value": 0.077
    }, {
        "created": "1974",
        "value": -0.213
    }, {
        "created": "1975",
        "value": -0.17
    }, {
        "created": "1976",
        "value": -0.254
    }, {
        "created": "1977",
        "value": 0.019
    }, {
        "created": "1978",
        "value": -0.063
    }, {
        "created": "1979",
        "value": 0.05
    }, {
        "created": "1980",
        "value": 0.077
    }, {
        "created": "1981",
        "value": 0.12
    }, {
        "created": "1982",
        "value": 0.011
    }, {
        "created": "1983",
        "value": 0.177
    }, {
        "created": "1984",
        "value": -0.021
    }, {
        "created": "1985",
        "value": -0.037
    }, {
        "created": "1986",
        "value": 0.03
    }, {
        "created": "1987",
        "value": 0.179
    }, {
        "created": "1988",
        "value": 0.18
    }, {
        "created": "1989",
        "value": 0.104
    }, {
        "created": "1990",
        "value": 0.255
    }, {
        "created": "1991",
        "value": 0.21
    }, {
        "created": "1992",
        "value": 0.065
    }, {
        "created": "1993",
        "value": 0.11
    }, {
        "created": "1994",
        "value": 0.172
    }, {
        "created": "1995",
        "value": 0.269
    }, {
        "created": "1996",
        "value": 0.141
    }, {
        "created": "1997",
        "value": 0.353
    }, {
        "created": "1998",
        "value": 0.548
    }, {
        "created": "1999",
        "value": 0.298
    }, {
        "created": "2000",
        "value": 0.267
    }, {
        "created": "2001",
        "value": 0.411
    }, {
        "created": "2002",
        "value": 0.462
    }, {
        "created": "2003",
        "value": 0.47
    }, {
        "created": "2004",
        "value": 0.445
    }, {
        "created": "2005",
        "value": 0.47
    }],
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
        "valueField": "value"
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
    "dataDateFormat": "YYYY",
    "categoryField": "created",
    "categoryAxis": {
        "minPeriod": "YYYY",
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

function zoomChart(){
    chart.zoomToIndexes(Math.round(chart.dataProvider.length * 0.4), Math.round(chart.dataProvider.length * 0.55));
}