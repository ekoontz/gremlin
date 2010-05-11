<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:gml="http://graphml.graphdrawing.org/xmlns"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xlink="http://www.w3.org/1999/xlink"
   version="1.0">

  <xsl:include href="graphml.xsl"/>

  <xsl:template match="gml:graph" mode="vertices">

    <svg version="1.1" xmlns="http://www.w3.org/2000/svg">
      <defs>
	<path id="Triangle" d="M 10,0 L -8,9 v-18 z" fill="black" stroke="none" />
      </defs>
      <xsl:apply-templates select="gml:edge"/>
    </svg>
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

    <xsl:variable name="text_x"><xsl:value-of select="($source_x + $target_x) div 2"/></xsl:variable>
    <xsl:variable name="text_y"><xsl:value-of select="($source_y + $target_y) div 2"/></xsl:variable>

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

</xsl:stylesheet>
