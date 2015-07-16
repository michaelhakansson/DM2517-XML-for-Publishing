<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="page">
    <html>
      <head>
        <title><xsl:apply-templates select="title" /></title>
        <meta name="author" content="{author}" />
        <meta name="version" content="{version}" />
      </head>

      <body>
        <xsl:apply-templates select="newscolumn | statuscolumn" />
      </body>

    </html>
  </xsl:template>


  <xsl:template match="newscolumn">
    <h1>
      Nyheter
    </h1>
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>

  <xsl:template match="statuscolumn">
    <h1>
      Projektstatus
    </h1>
    <ul>
      <xsl:apply-templates />
    </ul>
  </xsl:template>

  <xsl:template match="legal">
  </xsl:template>


  <xsl:template match="news">
      <li>
        <a href="{link}">
          <strong><xsl:apply-templates select="title" /></strong>
        </a>
         - 
        <strong>
          <xsl:apply-templates select="date/day" />&#160;<xsl:apply-templates select="date/month" />&#160;<xsl:apply-templates select="date/year" />.
        </strong>

        <xsl:apply-templates select="content" />

      </li>
  </xsl:template>

  <xsl:template match="link">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="date">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="content">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="year">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="month">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="day">
    <xsl:apply-templates />
  </xsl:template>



  <xsl:template match="project">
      <li>
        <a href="{link}">
          <strong><xsl:apply-templates select="title" /></strong>
        </a>
        <ul>
          <xsl:apply-templates select="release" />
        </ul>      
      </li>
  </xsl:template>



  <xsl:template match="release">
    <li>
      <strong><xsl:apply-templates select="version" /></strong>
       - 
      <strong><xsl:apply-templates select="status" /></strong>
      <xsl:apply-templates select="comment" />
    </li>
  </xsl:template>

  <xsl:template match="status">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="comment">
    <xsl:apply-templates />
  </xsl:template>


</xsl:stylesheet>

