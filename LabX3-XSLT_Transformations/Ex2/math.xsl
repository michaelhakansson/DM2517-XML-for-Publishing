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

</xsl:stylesheet>
