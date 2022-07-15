//public functions e.g.(TMcore.url)
var TMcore = TMcore || (function(window) {
	"use strict"
	localStorage.clear();
	var _core = {}

	_core.url = (function() {

		return location.pathname;
	});

	_core.context ="2Manage";
	
	
	_core.post = function(path, data) {
		var result = $.Deferred();
		data = _core.JsonParse(data);
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
	
		_core.postNoJson = function(path, data) {
		var result = $.Deferred();
		$.ajax({
			type: 'POST',
			url: path,
			contentType: 'application/json',
			dataType: 'json',
			data: data
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
				json[obj.name] = obj.value;
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
	
	_core.downloadImage = function(resp){
			var byteString = atob(resp);
			var ab = new ArrayBuffer(byteString.length);
			var ia = new Uint8Array(ab);
			
		    for (var i = 0; i < byteString.length; i++) {
		        ia[i] = byteString.charCodeAt(i);
		    }
			
			var blob = new Blob([ab], {type: 'image/jpg'});
			var url = URL.createObjectURL(blob);
		    const link = document.createElement('a');
		    link.href = url;
		    link.setAttribute('download', 'preview.png');
		    document.body.appendChild(link);
		    link.click();
	}
	
		_core.downloadZip = function(resp, proj){
			if(resp){
			var byteString = atob(resp);
			var ab = new ArrayBuffer(byteString.length);
			var ia = new Uint8Array(ab);
			
		    for (var i = 0; i < byteString.length; i++) {
		        ia[i] = byteString.charCodeAt(i);
		    }
			
			var blob = new Blob([ab], {type: 'application/zip'});
			var url = URL.createObjectURL(blob);
		    const link = document.createElement('a');
		    link.href = url;
		    link.setAttribute('download', proj+'.zip');
		    document.body.appendChild(link);
		    link.click();
			}else{
				alert("Projeto sem source code :(")
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


addOns("../favicon.ico");
addOns("../css/main.css");
addOns("../css/bootstrap.min.css");
addOns("../scripts/bs/bootstrap.min.js");
addOns("../scripts/font-awesome-4.7.0/css/font-awesome.min.css");


//adicioar nav bar
if (!location.pathname.includes("login") && !location.pathname.includes("registo")) {
	document.addEventListener('DOMContentLoaded', function() {
		
		if(location.pathname.includes("user")){
			
		var nav = document.createElement('div');
		nav.id = 'navbar-container';
		document.body.prepend(nav);
		$("#navbar-container").load("navbar_container.jsp");
		
		}	else if(location.pathname.includes("admin")){
			
		var nav = document.createElement('div');
		nav.id = 'sidebar-container';
		document.body.prepend(nav);
		$("#sidebar-container").load("navbar_container.jsp");
			
		}

	}, false);
}


