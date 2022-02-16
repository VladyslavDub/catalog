import Rails from "@rails/ujs"

document.addEventListener("turbolinks:load", () => {
  const sort_select = document.getElementById("sort")
  sort_select.addEventListener("change",()=>{

    const sort = event.target.value
    location.href = replaceUrlParam(location.href, 'sort', sort);
  });

});


function replaceUrlParam(url, paramName, paramValue) {
    if (paramValue == null) {
        paramValue = '';
    }

    const pattern = new RegExp('\\b(' + paramName + '=).*?(&|#|$)');

    if (url.search(pattern) >= 0) {
        return url.replace(pattern, '$1' + paramValue + '$2');
    }

    url = url.replace(/[?#]$/, '');

    return urlDecode(url + (url.indexOf('?') > 0 ? '&' : '?') + paramName + '=' + paramValue);
}

function urlDecode(url) {
    return decodeURIComponent(url.replace(/\+/g, ' '));
}