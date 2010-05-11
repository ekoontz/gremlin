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
      <g fill="white" stroke="black">
	<path fill="none" stroke-width="3" d="M118,130 C150,20 215,150 225,85" />
	<path fill="none" stroke-width="3" d="M229,65 C250,10 255,70 300,38" />
	<text fill="black" stroke-width="1" x="230" y="80" font-family="verdana" 
	      font-size="16" text-anchor="middle" background="black">created</text>
	<use xlink:href="#Triangle" transform="translate(305 38) rotate(340)" overflow="visible"/>
      </g>


      <!-- josh created ripple -->
      <g fill="white" stroke="black">
	<path fill="none" stroke-width="3" d="M325,305 325,360" />
	<text fill="black" stroke-width="1" x="365" y="335" font-family="verdana" 
	      font-size="16" text-anchor="middle" background="black">created</text>
	<use xlink:href="#Triangle" transform="translate(325 370) rotate(90)" overflow="visible"/>
      </g>

      <!-- marko knows josh -->
      <!-- marko is at: (10,125)
	   josh is at : (325,225) -->
      <g fill="white" stroke="black">
	<path fill="none" stroke-width="3" d="M10,125 325,225" />
	<text fill="black" stroke-width="1" x="200" y="175" font-family="verdana" 
	      font-size="16" text-anchor="middle" background="black">knows</text>
	<use xlink:href="#Triangle" transform="translate(325 225) rotate(90)" overflow="visible"/>
      </g>


      <xsl:apply-templates select="gml:edge[5]"/>
      <xsl:apply-templates select="gml:edge[6]"/>

    </svg>


  </xsl:template>

  <xsl:template match="gml:edge">
    <!--
	peter is at (600,200)
	lop is at (350,25) -->



    <xsl:variable name="source_x">600</xsl:variable>
    <xsl:variable name="source_y">200</xsl:variable>
    <xsl:variable name="dest_x">350</xsl:variable>
    <xsl:variable name="dest_y">25</xsl:variable>

    <xsl:variable name="text_x"><xsl:value-of select="$source_x + 0"/></xsl:variable>
    <xsl:variable name="text_y"><xsl:value-of select="$source_y - 100"/></xsl:variable>

    <xsl:variable name="source_top_y"><xsl:value-of select="$source_y + 25"/></xsl:variable>


    <xsl:variable name="arrow_left_x"><xsl:value-of select="$dest_x + 10"/></xsl:variable>
    <xsl:variable name="arrow_left_y"><xsl:value-of select="$dest_y + 10"/></xsl:variable>

    <g xmlns="http://www.w3.org/2000/svg" fill="white" stroke="black">
      <path fill="none" stroke-width="3" d="M{$source_x + 5},{$source_y + 5} {$dest_x + 5},{$dest_y + 5}" />
      <text fill="black" stroke-width="1" 
	    x="{$text_x}" y="{$text_y}" 
	    font-family="verdana" font-size="16" 
	    text-anchor="middle" background="black">
	<xsl:value-of select="@label"/>
 	(<xsl:value-of select="$text_y"/>)
	(weight: <xsl:value-of select="gml:data[@key='weight']"/>)
      </text>
      <use xlink:href="#Triangle" transform="translate({$arrow_left_x} {$arrow_left_y}) rotate(90)" overflow="visible"/>
    </g>

  </xsl:template>

</xsl:stylesheet>
