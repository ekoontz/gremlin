<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:gml="http://graphml.graphdrawing.org/xmlns"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
      <head>
	<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
	<title>Graphml Viewer</title>
	<xsl:apply-templates select="." mode="css"/>
	<xsl:apply-templates select="." mode="js"/>
      </head>
      <body>
	<html:h1>Graphml Viewer</html:h1>
	<html:div id="graph">
	  <xsl:apply-templates select="//gml:graphml"/>
	</html:div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="gml:graphml">
    <html:div class="node desc">
      <html:table>
	<tr>
	  <th>name</th>
	  <td>lop</td>
	</tr>
	<tr>
	  <th>lang</th>
	  <td>java</td>
	</tr>
      </html:table>
    </html:div>
  </xsl:template>

  <xsl:template match="*">
    <div class="catchall">
      catchall: <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="*" mode="css">
    <html:link href="graphml.css" media="screen" rel="stylesheet" type="text/css" />
  </xsl:template>

</xsl:stylesheet>
