<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i18n="xalan://org.mycore.services.i18n.MCRTranslation"
    xmlns:mcrver="xalan://org.mycore.common.MCRCoreVersion"
    xmlns:mcrxsl="xalan://org.mycore.common.xml.MCRXMLFunctions"
    exclude-result-prefixes="i18n mcrver mcrxsl">

  <xsl:import href="resource:xsl/layout/mir-common-layout.xsl" />

  <xsl:template name="mir.navigation">

    <div class="header_box container">

      <nav class="mir-prop-nav">
        <ul class="nav navbar-nav navbar-expand">
          <xsl:call-template name="mir.loginMenu" />
          <xsl:call-template name="mir.languageMenu" />
        </ul>
      </nav>

      <div class="project_logo_box">
        <a title="zur Homepage" href="https://www.iai.spk-berlin.de">
          <img alt="Logo IAI" src="{$WebApplicationBaseURL}images/logo-iai-main.png" />
        </a>
      </div>

      <div class="mir-main-nav project-main-nav">
        <nav class="navbar navbar-expand-lg navbar-light">
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target=".mir-main-nav__entries--mobile"
            aria-controls="mir-main-nav__entries--mobile"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon text-primary"></span>
          </button>
          <div class="collapse navbar-collapse mir-main-nav__entries">
            <ul class="navbar-nav">
              <xsl:call-template name="project.generate_single_menu_entry">
                <xsl:with-param name="menuID" select="'brand'"/>
              </xsl:call-template>
              <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='search']" />
              <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='publish']" />
              <xsl:call-template name="mir.basketMenu" />
            </ul>
          </div>
        </nav>
        <div class="search-button search-toggler js-search-toggler">
          <i class="fas fa-search search-button__icon"></i>
          <i class="fa-regular fa-circle-xmark search-button__close"></i>
        </div>
      </div>

    </div>

    <div class="collapse mir-main-nav__entries--mobile">
      <button
        class="mir-main-nav__entries--mobile-close btn"
        type="button"
        data-toggle="collapse"
        data-target=".mir-main-nav__entries--mobile"
        aria-controls="mir-main-nav__entries--mobile"
        aria-expanded="false"
        aria-label="Toggle navigation">
        <i class="far fa-times-circle "></i>
      </button>

      <ul class="navbar-nav">
        <xsl:call-template name="project.generate_single_menu_entry">
          <xsl:with-param name="menuID" select="'brand'"/>
        </xsl:call-template>
        <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='search']" />
        <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='publish']" />
        <xsl:call-template name="mir.basketMenu" />
      </ul>
    </div>

    <div class="search-bar">
      <div class="container p-0">
        <div class="search-bar__form">
          <form
            id="bs-searchHeader"
            action="{$WebApplicationBaseURL}servlets/solr/find"
            class="bs-search form-inline"
            role="search">

            <div class="js-searchbar search-bar__input">
              <input
                id="searchbar"
                name="condQuery"
                placeholder="{i18n:translate('mir.navsearch.placeholder')}"
                class="form-control search-query pp-rounded"
                type="text" />
              <xsl:choose>
                <xsl:when test="mcrxsl:isCurrentUserInRole('admin') or mcrxsl:isCurrentUserInRole('editor')">
                  <input name="owner" type="hidden" value="createdby:*" />
                </xsl:when>
                <xsl:when test="not(mcrxsl:isCurrentUserGuestUser())">
                  <input name="owner" type="hidden" value="createdby:{$CurrentUser}" />
                </xsl:when>
              </xsl:choose>
              <button type="submit" class="btn pnt-primary text-primary">
                <i class="fas fa-search search-button__icon"></i>
              </button>
            </div>

          </form>
        </div>
      </div>
    </div>

    <div class="page-position">
      <div class="container">
        <div class="page-position__title-box">
          <div class="page-position__title">
            <a title="zur Homepage" href="{$WebApplicationBaseURL}">
              Publikationsserver des IAI
            </a>
          </div>
        </div>
      </div>
    </div>

  </xsl:template>

  <xsl:template name="mir.jumbotwo">
  </xsl:template>

  <xsl:template name="mir.footer">

    <div class="container">
      <div class="row">
        <div class="col footer-contact">
          <h3>Ibero-Amerikanisches Institut</h3>
          <p>
            Anschrift:<br />
            Potsdamer Straße 37, 10785 Berlin<br />
            <a href="#">Kontakt</a>
          </p>
        </div>
        <div class="col-auto footer-logo">
          <a href="https://www.preussischer-kulturbesitz.de">
            <img alt="Logo IAI" src="{$WebApplicationBaseURL}images/logo-iai-footer.png" />
          </a>
        </div>
      </div>
    </div>

    <div class="flatmir-footer__bottom">
      <div class="container">
        <div class="row ">
          <div class="col-auto footer-nav">
            <ul class="nav flex-column flex-lg-row">
              <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='below']/*" />
            </ul>
          </div>

          <div class="col social-nav" >
            <ul class="nav">
              <li>
                <a
                  href="xxx"
                  class="facebook">
                  <span class="fa-stack">
                    <i class="fab fa-facebook-f fa-stack-2x"></i>
                  </span>
                  <span class="d-none">xxx</span>
                </a>
              </li>
              <li>
                <a
                  href="xxx"
                  class="instagram">
                  <span class="fa-stack">
                    <i class="fab fa-instagram fa-stack-2x"></i>
                  </span>
                  <span class="d-none">xxx</span>
                </a>
              </li>
              <li>
                <a
                  href="xxx"
                  class="twitter">
                  <span class="fa-stack">
                    <i class="fab fa-twitter fa-stack-2x"></i>
                  </span>
                  <span class="d-none">xxx</span>
                </a>
              </li>
              <li>
                <a
                  href="xxx"
                  class="youtube">
                  <span class="fa-stack">
                    <i class="fab fa-youtube fa-stack-2x"></i>
                  </span>
                  <span class="d-none">xxx</span>
                </a>
              </li>
            </ul>
          </div>
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

  <xsl:template name="project.generate_single_menu_entry">
    <xsl:param name="menuID" />

    <xsl:variable name="activeClass">
      <xsl:choose>
        <xsl:when test="$loaded_navigation_xml/menu[@id=$menuID]/item[@href = $browserAddress ]">
        <xsl:text>active</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>not-active</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <li class="nav-item {$activeClass}">

      <a id="{$menuID}" href="{$WebApplicationBaseURL}{$loaded_navigation_xml/menu[@id=$menuID]/item/@href}" class="nav-link" >
        <xsl:choose>
          <xsl:when test="$loaded_navigation_xml/menu[@id=$menuID]/item/label[lang($CurrentLang)] != ''">
            <xsl:value-of select="$loaded_navigation_xml/menu[@id=$menuID]/item/label[lang($CurrentLang)]" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$loaded_navigation_xml/menu[@id=$menuID]/item/label[lang($DefaultLang)]" />
          </xsl:otherwise>
        </xsl:choose>
      </a>
    </li>
  </xsl:template>

</xsl:stylesheet>
