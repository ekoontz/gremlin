<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:html="http://www.w3.org/1999/xhtml"
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
	<h1>Graphml Viewer</h1>
	<h2><xsl:value-of select="name()"/></h2>
	<div id="graph">
	</div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="*" mode="css">
    <link href="graphml.css" media="screen" rel="stylesheet" type="text/css" />
  </xsl:template>

</xsl:stylesheet>
