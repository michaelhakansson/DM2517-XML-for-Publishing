<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Extralaboration 1</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
  
    <xsl:template match="h1">
        <xsl:copy-of select="."/>
    </xsl:template>

    <!-- Ex 2 multiplication -->

    <xsl:template match="times">
        <xsl:variable name="times1">
            <xsl:apply-templates select="fact"/>
        </xsl:variable>
        <xsl:variable name="times2">
            <xsl:apply-templates select="fib"/>
        </xsl:variable>
        <xsl:variable name="pro" select="$times1 * $times2"/>
        <xsl:value-of select="$pro"/>
    </xsl:template>

    <!-- Ex 3 factorial -->

    <xsl:template match="fact">
        <xsl:call-template name="factorial">
            <xsl:with-param name="n" select="."/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="factorial">
        <xsl:param name="n" select="1"/>
        <xsl:variable name="nsubone">
            <xsl:if test="$n = 1">
                1
            </xsl:if>
            <xsl:if test="$n != 1">
                <xsl:call-template name="factorial">
                    <xsl:with-param name="n" select="$n - 1"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="$n * $nsubone"/>
    </xsl:template>
</xsl:stylesheet>
