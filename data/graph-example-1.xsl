<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:gml="http://graphml.graphdrawing.org/xmlns"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">

  <xsl:include href="graphml.xsl"/>

  <xsl:template match="gml:node[gml:data[@key='name']='marko']">
    <xsl:apply-templates select="." mode="default">
      <xsl:with-param name="class">x50 y0</xsl:with-param>
    </xsl:apply-templates>
  </xsl:template>

</xsl:stylesheet>
