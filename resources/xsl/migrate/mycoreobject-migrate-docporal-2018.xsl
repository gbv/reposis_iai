<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:mcrmods="xalan://org.mycore.mods.classification.MCRMODSClassificationSupport"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:mods="http://www.loc.gov/mods/v3">
  
  <xsl:include href="copynodes.xsl" />
  <xsl:param name="MCR.Metadata.Service.State.Category.Default" select="'submitted'" />
  <xsl:variable name="id" select="/mycoreobject/@ID" />
  

  <xsl:template match="mods:classification[@authorityURI='http://reposis.gbv.de/iai/classifications/status']" />
  <xsl:template match="service">
    <xsl:copy>
      <xsl:apply-templates />
      
      <servstates class="MCRMetaClassification">
        <servstate inherited="0" classid="state">
          <xsl:variable name="oldstatus"
            select="substring-after(//mods:mods/mods:classification[@authorityURI='http://reposis.gbv.de/iai/classifications/status']/@valueURI,'#')" />
          <xsl:attribute name="categid">
            <xsl:choose>
              <xsl:when test="string-length($oldstatus)&gt;0">
                <xsl:value-of select="$oldstatus" />
              </xsl:when>
              <xsl:when test="servstates/servstate[@classid='state']">
                <xsl:value-of select="servstates/servstate[@classid='state']/@categid" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$MCR.Metadata.Service.State.Category.Default" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </servstate>
      </servstates>
      
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="mods:languageTerm[@authority='rfc4646']">
    <mods:languageTerm authority="rfc5646" type="code"><xsl:value-of select="."/></mods:languageTerm>
  </xsl:template>
  
  <xsl:template match="mods:accessCondition[@type='use and reproduction']">
    <xsl:variable name="katId">
      <xsl:choose>
        <xsl:when test="starts-with(.,'cc_') and not(contains(.,'_3.0'))">
          <xsl:value-of select="concat(.,'_3.0')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <mods:accessCondition type="use and reproduction" xlink:href="http://www.mycore.org/classifications/mir_licenses#{$katId}" xlink:type="simple"/>
  </xsl:template>
  
  <xsl:template match="mods:mods/mods:relatedItem[@type='host']">
    <xsl:copy>
      <xsl:attribute name="xlink:href">
        <xsl:value-of select="/mycoreobject/structure/parents/parent/@xlink:href"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="mods:genre[@authorityURI='http://reposis.gbv.de/iai/classifications/genres']" >
    <xsl:variable name="genre"
         select="substring-after(//mods:mods/mods:genre[@authorityURI='http://reposis.gbv.de/iai/classifications/genres']/@valueURI,'#')" />
    <mods:genre type="intern" authorityURI="http://www.mycore.org/classifications/mir_genres" valueURI="http://www.mycore.org/classifications/mir_genres#{$genre}"/>
  </xsl:template>
  
  
</xsl:stylesheet>