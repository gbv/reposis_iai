<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:mcrmods="xalan://org.mycore.mods.classification.MCRMODSClassificationSupport"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:mods="http://www.loc.gov/mods/v3">
  
  <xsl:include href="copynodes.xsl" />
  
  <xsl:template match="mods:mods/mods:titleInfo[not(xml:lang)]">
    <xsl:variable name="language">
      <xsl:choose>
        <xsl:when test="count(//mods:mods/mods:language/mods:languageTerm[@authority='rfc5646']) &gt; 0">
          <xsl:value-of select="//mods:mods/mods:language/mods:languageTerm[@authority='rfc5646']" />
        </xsl:when>
        <xsl:when test="count(//mods:mods/mods:relatedItem[@type='host']/mods:language/mods:languageTerm[@authority='rfc5646']) &gt; 0">
          <xsl:value-of select="//mods:mods/mods:relatedItem[@type='host']/mods:language/mods:languageTerm[@authority='rfc5646']" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="'de'"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <mods:titleInfo xml:lang="{$language}">
      <xsl:apply-templates select="@*|node()"/>
    </mods:titleInfo>
  </xsl:template>
    
</xsl:stylesheet>