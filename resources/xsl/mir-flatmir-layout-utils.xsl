<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i18n="xalan://org.mycore.services.i18n.MCRTranslation"
    xmlns:mcrver="xalan://org.mycore.common.MCRCoreVersion"
    xmlns:mcrxsl="xalan://org.mycore.common.xml.MCRXMLFunctions"
    exclude-result-prefixes="i18n mcrver mcrxsl">

  <xsl:import href="resource:xsl/layout/mir-common-layout.xsl" />
  <xsl:template name="mir.navigation">

    <div id="header_box" class="clearfix container">
      <div id="options_nav_box" class="mir-prop-nav">
        <nav>
          <ul class="nav navbar-nav pull-right">
            <xsl:call-template name="mir.loginMenu" />
            <xsl:call-template name="mir.languageMenu" />
          </ul>
        </nav>
      </div>
      <div id="project_logo_box">
        <a href="{concat($WebApplicationBaseURL,substring($loaded_navigation_xml/@hrefStartingPage,2),$HttpSession)}"
		class="">
	    <img src="{$WebApplicationBaseURL}images/lg_iaipk.gif" alt="" />	
        </a>
      </div>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="navbar navbar-default mir-main-nav">
      <div class="container">

        <div class="navbar-header">
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".mir-main-nav-entries">
            <span class="sr-only"> Toggle navigation </span>
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
          </button>
        </div>

        <div class="searchfield_box">
          <form action="{$WebApplicationBaseURL}servlets/solr/find" class="navbar-form navbar-left pull-right" role="search">
            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
            <div class="form-group">
              <input name="condQuery" placeholder="{i18n:translate('mir.navsearch.placeholder')}" class="form-control search-query" id="searchInput" type="text" />
              <xsl:choose>
                <xsl:when test="mcrxsl:isCurrentUserInRole('admin') or mcrxsl:isCurrentUserInRole('editor')">
                  <input name="owner" type="hidden" value="createdby:*" />
                </xsl:when>
                <xsl:when test="not(mcrxsl:isCurrentUserGuestUser())">
                  <input name="owner" type="hidden" value="createdby:{$CurrentUser}" />
                </xsl:when>
              </xsl:choose>
            </div>
          </form>
        </div>

        <nav class="collapse navbar-collapse mir-main-nav-entries">
          <ul class="nav navbar-nav pull-left">
            <xsl:for-each select="$loaded_navigation_xml/menu">
              <xsl:choose>
                <xsl:when test="@id='main'"/> <!-- Ignore some menus, they are shown elsewhere in the layout -->
                <xsl:when test="@id='brand'"/>
                <xsl:when test="@id='below'"/>
                <xsl:when test="@id='user'"/>
                <xsl:otherwise>
                  <xsl:apply-templates select="."/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
            <xsl:call-template name="mir.basketMenu" />
          </ul>
        </nav>

      </div><!-- /container -->
    </div>
  </xsl:template>

  <xsl:template name="mir.jumbotwo">
  </xsl:template>

  <xsl:template name="mir.footer">
    <div class="container">
      <div class="row">
	<div class="mir-logo-box col-xs-12 col-sm-6 col-md-4">
          <a href="http://www.iai.spk-berlin.de/" title="Zum Ibero-Amerikanischen Institut">
            <img src="{$WebApplicationBaseURL}images/iai_logo_yellow_free.png" alt="" />
          </a>
        </div>
	<div class="mir-footer-nav col-xs-12 col-sm-6 col-md-8">
	  <ul>
            <li><a href="{$WebApplicationBaseURL}content/below/imprint.xml">Impressum</a></li>
	    <li><a href="{$WebApplicationBaseURL}content/below/privacy.xml">Datenschutz</a></li>
        <li><a href="{$WebApplicationBaseURL}content/below/accessibility.xml">Barrierefreiheit</a></li>
	    <li><a href="{$WebApplicationBaseURL}content/below/contact.xml">Kontakt</a></li>
	  </ul>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="mir.powered_by">
    <xsl:variable name="mcr_version" select="concat('MyCoRe ',mcrver:getCompleteVersion())" />
    <div id="powered_by">
      <a href="http://www.mycore.de">
        <img src="{$WebApplicationBaseURL}mir-layout/images/mycore_logo_small_invert.png" title="{$mcr_version}" alt="powered by MyCoRe" />
      </a>
    </div>
  </xsl:template>

</xsl:stylesheet>
