$(function() {
    $('#acInput').autocomplete({
        source: function (request, response) {
            $.getJSON("/autocomplete/", {
                term: request.term
            }, response);
        }
    });
});

$(function() {
    $('#tagInput').autocomplete({
        source: function (request, response) {
            $.getJSON("/tags/", {
                term: request.term
            }, response);
        }
    });
});

function companies(){
    var d = document.getElementById('acInput').value;
    window.location='/search/companies/?searchLine='+d;
}

function users(){
    var d = document.getElementById('acInput').value;
    window.location='/search/users/?searchLine='+d;
}

function deals(){
    var d = document.getElementById('acInput').value;
    window.location='/search/deals/?searchLine='+d;
}

function searchAll(){
    var d = document.getElementById('acInput').value;
    window.location='/search/all/?searchLine='+d;
}