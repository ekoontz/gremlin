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
	  <xsl:apply-templates select="//gml:graphml/gml:graph"/>
	</html:div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="gml:graph">
    <xsl:apply-templates select="gml:node"/>
  </xsl:template>

  <xsl:template match="gml:node">
    <xsl:apply-templates select="." mode="default"/>
  </xsl:template>

  <xsl:template match="gml:node" mode="ball">
    <xsl:param name="position">1</xsl:param>
    <xsl:param name="class"/>
    <div class="ball {$class}">
      <xsl:value-of select="$position"/>
    </div>
  </xsl:template>

  <xsl:template match="gml:node" mode="node">
    <xsl:param name="class">x0 y0</xsl:param>
    <xsl:param name="position" select="position()"/>

    <div class="nodepack {$class}">
      <xsl:apply-templates select="." mode="default"/>
      
      <xsl:apply-templates select="." mode="ball">
	<xsl:with-param name="position" select="$position"/>
      </xsl:apply-templates>

      </div>

    </xsl:template>

  <xsl:template match="gml:node" mode="default">
    <xsl:param name="class"/>
    <div class="node desc {$class}">
      <table>
	<xsl:apply-templates select="gml:data"/>
      </table>
    </div>
  </xsl:template>

  <xsl:template match="gml:data">
    <tr>
      <th><xsl:value-of select="@key"/></th>
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>

  <xsl:template match="*">
    <div class="catchall">
      catchall[name()=<xsl:value-of select="name()"/>]: <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="*" mode="css">
    <html:link href="graphml.css" media="screen" rel="stylesheet" type="text/css" />
  </xsl:template>

</xsl:stylesheet>
