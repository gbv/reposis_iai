<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:mcrxml="xalan://org.mycore.common.xml.MCRXMLFunctions"
  xmlns:mods="http://www.loc.gov/mods/v3" 
  xmlns:xlink="http://www.w3.org/1999/xlink">
  
  <xsl:include href="copynodes.xsl" />
  
  <xsl:key name="kGenreByID" match="mods:mods/mods:genre" use="substring-after(@valueURI,'#')"/>
  
  <!-- <xsl:template match="mods:mods/mods:genre[preceding-sibling::mods:genre[substring(@valueURI,'#')=substring-after(following-sibling::mods.genre/@valueURI,'#')]]"/> -->
  <xsl:template match="mods:mods/mods:genre[not(generate-id() = generate-id(key('kGenreByID',substring-after(@valueURI,'#'))[1]))]" />
     
  
</xsl:stylesheet>