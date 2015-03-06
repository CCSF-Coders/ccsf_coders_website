/* Function that can be used to link some arbitrary object on a click
i.e. link('index.html', false); */
var link = function(url, newTab) {
  if(newTab == true)
  {
    window.open(url, "_blank");
  }
  else
  {
    window.location.href = url;
  }
}

