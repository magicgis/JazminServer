<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Graph</title>
  </head>
  <body>
   <div id="graph" style="width: 100%; height: 100%"><h1 style="text-aligin:center">Loading</h1></div>
    <script type="text/vnd.graphviz" id="cluster">
	${dot_string}
	</script>
    <script src="/js/viz.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/svg-pan-zoom.js"></script>
    <script>

      function inspect(s) {
        return "<pre>" + s.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\"/g, "&quot;") + "</pre>"
      }
      
      function src(id) {
        return document.getElementById(id).innerHTML;
      }
      
      function gen(id, format, engine) {
        var result;
        try {
          result = Viz(src(id), format, engine);
          if (format === "svg")
            return result;
          else
            return inspect(result);
        } catch(e) {
          return inspect(e.toString());
        }
      }
      var ss= gen("cluster", "svg");
      document.getElementById("graph").innerHTML =ss;
      //
      window.onload = function() {
        var svgElement = document.getElementsByTagName("svg")[0];
       	var zoomSvg = svgPanZoom(svgElement, {
          zoomEnabled: true,
          controlIconsEnabled: true,
          fit: true,
          center: true,
          viewportSelector: document.getElementById('graph').querySelector('#graph0')
        });
       	zoomSvg.zoom(0.2)
        zoomSvg.pan({x: 20, y: 500})
      };
      //
    </script>
    
  </body>
</html>
