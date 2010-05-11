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
    </svg>
  </xsl:template>

</xsl:stylesheet>
