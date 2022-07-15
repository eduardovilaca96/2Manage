
//public functions e.g.(TMcore.url)
var MScript = MScript || (function(window) {
	"use strict"

	var _core = {}


	_core.url = (function() {

		return location.pathname;
	});

	_core.post = function(path, data) {

		var result = $.Deferred();

		$.ajax({
			type: 'POST',
			url: path,
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify(data)
		}).done(function(resp) {

			if (resp != null && (resp.status == 'ERROR' || resp.status == 'NOK')) {
				result.reject(resp);
			}
			else {
				result.resolve(resp);
			}
		}).fail(function(resp) {
			result.reject(resp);
		});

		return result.promise();
	}

	_core.get = function(path, data) {

		var result = $.Deferred();

		$.ajax({
			type: 'GET',
			url: path,
			data: JSON.stringify(data)
		}).done(function(resp) {

			if (resp != null && (resp.status == 'ERROR' || resp.status == 'NOK')) {
				result.reject(resp);
			}
			else {
				result.resolve(resp);
			}
		}).fail(function(resp) {
			result.reject(resp);
		});

		return result.promise();

	}

	_core.JsonParse = function(array) {

		var json = {};

		if (array && $.isArray(array)) {
			$.each(array, function(idx, obj) {
				json[obj.name] = obj.name;
			});

			return json;
		} else {
			alert("Erro ao Parsar Json");
		}
	}

	_core.greeting = function() {
		var data = new Date();
		var horas = data.getHours();

		const manha = [7, 8, 9, 10, 11, 12];
		const tarde = [13, 14, 15, 16, 17, 18];
		const noite = [19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6];


		if (manha.includes(horas)) {
			return "Bom dia ";
		} else if (tarde.includes(horas)) {
			return "Boa tarde ";
		} else if (noite.includes(horas)) {
			return "Boa noite ";
		}

	}

	return _core;
})(this);

//imports
function addOns(url) {

	//nav e side bar

	//js e css
	if (url.includes("js")) {

		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = url;
		document.head.appendChild(script);


	} else if (url.includes("css")) {

		var link = document.createElement('link');
		link.href = url;
		link.rel = "stylesheet";
		document.head.appendChild(link);

	} else if (url.includes("ico")) {

		var ico = document.createElement('link');
		ico.href = url;
		ico.type = "image/x-icon"
		ico.rel = "shortcut icon";
		document.head.appendChild(ico);
	}

}


addOns("../css/main.css");
addOns("../css/bootstrap.min.css");
addOns("../favicon.ico");
addOns("../scripts/jquery-3.6.0.min.js");
addOns("../scripts/bs/bootstrap.min.js");
addOns("../scripts/fontawesome.min.js");

//adicioar nav bar
if (!location.pathname.includes("login") && !location.pathname.includes("registo")) {
	document.addEventListener('DOMContentLoaded', function() {

		var nav = document.createElement('div');
		nav.id = 'navbar-container';
		document.body.prepend(nav);
		$("#navbar-container").load("navbar_container.jsp");

		//	var footer = document.createElement('div');
		//	footer.id = 'footer-container';
		//	document.body.append(footer);
		//	$("#footer-container").load("footer_container.jsp");

	}, false);
}


