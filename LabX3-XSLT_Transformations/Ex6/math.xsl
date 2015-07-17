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

    <!-- Ex 4 fibonacci -->

    <xsl:template match="fib">
        <xsl:call-template name="fibonacci">
            <xsl:with-param name="left" select="0"/>
            <xsl:with-param name="right" select="1"/>
            <xsl:with-param name="levelsremains" select="."/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="fibonacci">
        <xsl:param name="left"/>
        <xsl:param name="right"/>
        <xsl:param name="levelsremains"/>
        <xsl:if test="$levelsremains = 1">
            <xsl:value-of select="$right"/>
        </xsl:if>
        <xsl:if test="$levelsremains > 0">
            <xsl:call-template name="fibonacci">
                <xsl:with-param name="left" select="$right"/>
                <xsl:with-param name="right" select="$right + $left"/>
                <xsl:with-param name="levelsremains" select="$levelsremains - 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Ex 5 reverse -->

    <xsl:template match="reverse">
        <xsl:call-template name="reversify">
            <xsl:with-param name="str" select="."/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="reversify">
        <xsl:param name="str"/>
        <xsl:variable name="strlen" select="string-length($str)"/>
        <xsl:if test="$strlen = 1">
            <xsl:value-of select="$str"/>
        </xsl:if>
        <xsl:if test="$strlen = 2">
            <xsl:value-of select="substring($str, 2, 1)"/>
            <xsl:value-of select="substring($str, 1, 1)"/>
        </xsl:if>
        <xsl:if test="$strlen > 2">
            <xsl:value-of select="substring($str, $strlen, 1)"/>
            <xsl:call-template name="reversify">
                <xsl:with-param name="str" select="substring($str, 0, $strlen)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Ex 6 euclides algorithm -->

    <xsl:template match="euclides">
        <xsl:call-template name="gcd">
            <xsl:with-param name="a" select="term[1]"/>
            <xsl:with-param name="b" select="term[2]"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="gcd">
        <xsl:param name="a"/>
        <xsl:param name="b"/>
        <xsl:if test="$b = 0">
            <xsl:value-of select="$a"/>
        </xsl:if>
        <xsl:if test="$b != 0">
            <xsl:call-template name="gcd">
                <xsl:with-param name="a" select="$b"/>
                <xsl:with-param name="b" select="$a mod $b"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
