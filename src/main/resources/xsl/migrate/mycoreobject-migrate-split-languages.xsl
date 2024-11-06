<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:mcrmods="xalan://org.mycore.mods.classification.MCRMODSClassificationSupport"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:mods="http://www.loc.gov/mods/v3">
  
  <xsl:include href="copynodes.xsl" />
  
  <xsl:template match="mods:mods/mods:language">
    <xsl:for-each select="mods:languageTerm">
      <mods:language>
        <mods:languageTerm authority="rfc5646" type="code"><xsl:value-of select="."/></mods:languageTerm>
      </mods:language>
    </xsl:for-each>
  </xsl:template>
    
</xsl:stylesheet>