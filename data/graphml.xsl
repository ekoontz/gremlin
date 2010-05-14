<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:gml="http://graphml.graphdrawing.org/xmlns"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   xmlns:svg="http://www.w3.org/2000/svg"
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
	<div id="graph">
	  <xsl:apply-templates select="//gml:graphml/gml:graph"/>
	</div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="gml:graph">
    <xsl:apply-templates select="gml:node"/>
    <xsl:apply-templates select="." mode="vertices"/>
  </xsl:template>

  <xsl:template match="gml:graph" mode="vertices">
    <svg:svg version="1.1">
      <svg:defs>
	<svg:path id="Triangle" d="M 10,0 L -8,9 v-18 z" fill="black" stroke="none" />
      </svg:defs>
      <xsl:apply-templates select="gml:edge"/>
    </svg:svg>
  </xsl:template>

  <xsl:template match="gml:node">
    <xsl:apply-templates select="." mode="node">
      	<xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="gml:node" mode="ball">
    <xsl:param name="position">1</xsl:param>
    <xsl:param name="class"/>
    <div class="ball {$class}">
      <xsl:value-of select="$position"/>
    </div>
  </xsl:template>

  <xsl:template match="gml:node" mode="node">
    <xsl:param name="class"/>
    <xsl:param name="style"/>
    <xsl:param name="x"><xsl:value-of select="@x"/></xsl:param>
    <xsl:param name="y"><xsl:value-of select="@y"/></xsl:param>
    <xsl:param name="position" select="position()"/>

    <div class="nodepack {$class}" style="left:{$x}px;top:{$y}px;{$style}">
      <xsl:if test="$style">
	<xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="." mode="data">
	<xsl:with-param name="position" select="$position"/>
      </xsl:apply-templates>
      
      <xsl:apply-templates select="." mode="ball">
	<xsl:with-param name="position" select="$position"/>
      </xsl:apply-templates>

      </div>

    </xsl:template>

  <xsl:template match="gml:node" mode="data">
    <xsl:param name="class"/>
    <xsl:param name="position"/>
    <div class="node desc {$class}">
      <table>
	<xsl:apply-templates select="gml:data"/>
	<xsl:if test="$position = '1'">
	  <tr class="debug">
	    <th>debug</th>
	    <td><xsl:apply-templates select="//gml:edge[2]" mode="debug"/></td>
	  </tr>
	</xsl:if>
      </table>
    </div>
  </xsl:template>

  <xsl:template match="gml:edge" mode="debug">
    <xsl:variable name="source_id"><xsl:value-of select="@source"/></xsl:variable>
    <xsl:variable name="target_id"><xsl:value-of select="@target"/></xsl:variable>

    <xsl:variable name="source_x"><xsl:value-of select="../gml:node[@id = $source_id]/@x + 0"/></xsl:variable>
    <xsl:variable name="source_y"><xsl:value-of select="../gml:node[@id = $source_id]/@y + 0"/></xsl:variable>

    <xsl:variable name="target_x"><xsl:value-of select="../gml:node[@id = $target_id]/@x + 0"/></xsl:variable>
    <xsl:variable name="target_y"><xsl:value-of select="../gml:node[@id = $target_id]/@y + 0"/></xsl:variable>

    ( <xsl:value-of select="$source_x"/> , <xsl:value-of select="$source_y"/> )

    ( <xsl:value-of select="$target_x"/> , <xsl:value-of select="$target_y"/> )


  </xsl:template>

  <xsl:template match="gml:data">
    <tr>
      <th><xsl:value-of select="@key"/></th>
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>

  <xsl:template match="gml:edge">
    <xsl:variable name="source_id"><xsl:value-of select="@source"/></xsl:variable>
    <xsl:variable name="target_id"><xsl:value-of select="@target"/></xsl:variable>

    <!-- for debugging. must be after $source_id variable definition. -->
    <xsl:variable name="debug"><xsl:value-of select="../gml:node[@id = $target_id]/@y + 0"/></xsl:variable>
 
    <xsl:variable name="source_x"><xsl:value-of select="../gml:node[@id = $source_id]/@x + 0"/></xsl:variable>
    <xsl:variable name="source_y"><xsl:value-of select="../gml:node[@id = $source_id]/@y + 0"/></xsl:variable>

    <xsl:variable name="target_x"><xsl:value-of select="../gml:node[@id = $target_id]/@x + 0"/></xsl:variable>
    <xsl:variable name="target_y"><xsl:value-of select="../gml:node[@id = $target_id]/@y + 0"/></xsl:variable>

    <xsl:variable name="text_x"><xsl:value-of select="(($source_x + $target_x) div 2) + 50"/></xsl:variable>
    <xsl:variable name="text_y"><xsl:value-of select="(($source_y + $target_y) div 2) + 30"/></xsl:variable>

    <xsl:variable name="source_top_y"><xsl:value-of select="$source_y + 25"/></xsl:variable>


    <xsl:variable name="arrow_left_x"><xsl:value-of select="$target_x + 10"/></xsl:variable>
    <xsl:variable name="arrow_left_y"><xsl:value-of select="$target_y + 10"/></xsl:variable>

    <g xmlns="http://www.w3.org/2000/svg" fill="white" stroke="black">
      <path fill="none" stroke-width="3" d="M{$source_x + 5},{$source_y + 5} {$target_x + 5},{$target_y + 5}" />
      <text fill="black" stroke-width="1" 
	    x="{$text_x}" y="{$text_y}" 
	    font-family="verdana" font-size="16" 
	    text-anchor="middle" background="black">
	<xsl:value-of select="@label"/>
      </text>
      <use xlink:href="#Triangle" transform="translate({$arrow_left_x} {$arrow_left_y}) rotate(90)" overflow="visible"/>
    </g>

  </xsl:template>

  <xsl:template match="*" mode="css">
    <html:link href="graphml.css" media="screen" rel="stylesheet" type="text/css" />
  </xsl:template>

  <xsl:template match="*" mode="js"/>

  <xsl:template match="*">
    <div class="catchall">
      catchall[name()=<xsl:value-of select="name()"/>]: <xsl:value-of select="."/>
    </div>
  </xsl:template>

</xsl:stylesheet>
