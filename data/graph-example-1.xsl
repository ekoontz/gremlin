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

  <xsl:template match="gml:node[gml:data[@key='name']='lop']">

    <svg version="1.1" xmlns="http://www.w3.org/2000/svg">
      <defs>
	<path id="Triangle" d="M 10,0 L -8,9 v-18 z" fill="black" stroke="none" />
      </defs>
      <g fill="white" stroke="black">
	<path fill="none" stroke-width="3" d="M118,130 225,85" />
	<path fill="none" stroke-width="3" d="M265,70 360,29" />
	<text fill="solid" x="230" y="80" font-family="verdana" 
	      font-size="16" text-anchor="middle" background="black">created</text>
	<use xlink:href="#Triangle" transform="translate(366 25) rotate(340)" overflow="visible"/>
      </g>
    </svg>

    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x50 y0</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>

    <img src="vertex.svg"/>
    

  </xsl:template>

  <xsl:template match="gml:node[gml:data[@key='name']='marko']">
    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x0 y20</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="gml:node[gml:data[@key='name']='vadas']">
    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x0 y45</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="gml:node[gml:data[@key='name']='josh']">
    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x45 y25</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="gml:node[gml:data[@key='name']='peter']">
    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x80 y20</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="gml:node[gml:data[@key='name']='ripple']">
    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x45 y65</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
  </xsl:template>

</xsl:stylesheet>
