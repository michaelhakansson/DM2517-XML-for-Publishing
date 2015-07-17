<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="report">
        <html>
            <xsl:apply-templates select="//head"/>
            <body>
                <h1><xsl:value-of select="head/title"/></h1>
                <p>Authors:
                    <xsl:for-each select="head/authors/author">
                        <xsl:value-of select="."/>
                        <xsl:if test="following-sibling::author">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </p>
                <p>Keywords:
                    <xsl:for-each select="head/keywords/keyword">
                        <xsl:value-of select="."/>
                        <xsl:if test="following-sibling::keyword">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </p>
                <xsl:apply-templates select="//body"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="head">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <link href="http://www.csc.kth.se/~bjornh/2D1517/kthstandard.mac.css" type="text/css" rel="stylesheet"/>
            <title><xsl:value-of select="title"/></title>
        </head>
    </xsl:template>

    <xsl:template match="body">
        <p>
            <xsl:for-each select="h1">
                <xsl:number level="multiple" format="1." grouping-separator=" "/>
                <xsl:text> </xsl:text>
                <a href="#{generate-id(.)}">
                    <xsl:value-of select="@title"/>
                </a><br/>
                <xsl:for-each select="h2">
                    <xsl:number level="multiple" format="1." grouping-separator=" " count="h1|h2"/>
                    <xsl:text> </xsl:text>
                    <a href="#{generate-id(.)}">
                        <xsl:value-of select="@title"/>
                    </a><br/>
                    <xsl:for-each select="h3">
                        <xsl:number level="multiple" format="1." grouping-separator=" " count="h1|h2|h3"/>
                        <xsl:text> </xsl:text>
                        <a href="#{generate-id(.)}">
                            <xsl:value-of select="@title"/>
                        </a><br/>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </p>
        <xsl:for-each select="h1">
            <a name="{generate-id(.)}"/>
            <h2>
                <xsl:number level="multiple" format="1." grouping-separator=" "/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="@title"/>
            </h2>
            <xsl:for-each select="p">
                <p><xsl:value-of select="."/></p>
            </xsl:for-each>
            <xsl:for-each select="h2">
                <a name="{generate-id(.)}"/>
                <h2>
                    <xsl:number level="multiple" format="1." grouping-separator=" " count="h1|h2"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@title"/>
                </h2>
                <xsl:for-each select="p">
                    <p><xsl:value-of select="."/></p>
                </xsl:for-each>
                <xsl:for-each select="h3">
                    <a name="{generate-id(.)}"/>
                    <h2>
                        <xsl:number level="multiple" format="1." grouping-separator=" " count="h1|h2|h3"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="@title"/>
                    </h2>
                    <xsl:for-each select="p">
                        <p><xsl:value-of select="."/></p>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
