#!/usr/bin/env ruby

require 'erb'
require 'cgi'

cgi = CGI..new
print cgi.header("charset" => "shift_jis")

word = cgi.params['word'][0] || 'tech.upper'

put ERB.new(DATA.read).result(binding)
__END__
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=shift_jis" />
    <title>THE MATRIX</title>
	<style type="text/css">
	.matrix { font-family:Lucida Console, Courier, Monotype; font-size:10pt; text-align:center; width:10px; padding:0px; margin:0px;}
	</style>
    <script type="text/javascript" src="matrix.js"></script>
  </head>
  <body>
    <div id="matrix"><%= CGI.escapeHTML(word) %></div>
  </body>
</html>