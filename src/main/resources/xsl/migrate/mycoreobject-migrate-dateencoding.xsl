<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:mods="http://www.loc.gov/mods/v3">
  <xsl:include href="copynodes.xsl" />
  
  <xsl:template match="//mods:dateIssued[not(@encoding)]">
    <mods:dateIssued>
      <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </mods:dateIssued>
  </xsl:template>
</xsl:stylesheet>