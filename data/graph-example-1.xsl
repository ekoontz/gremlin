<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:gml="http://graphml.graphdrawing.org/xmlns"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">

  <xsl:include href="graphml.xsl"/>

  <xsl:template match="gml:node[gml:data[@key='name']='lop']">
    <xsl:apply-templates select="." mode="node">
      <xsl:with-param name="class">x50 y0</xsl:with-param>
      <xsl:with-param name="position" select="position()"/>
    </xsl:apply-templates>
    <img style="position:absolute;left:15%;top:5%" width="35%" height="200px" src="image-svg.svg"/>

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
