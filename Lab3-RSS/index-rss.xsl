<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rss="http://purl.org/rss/1.0/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:syn="http://purl.org/rss/1.0/modules/syndication/"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0">
    <xsl:output indent="yes"/>

    <xsl:template match="rdf:RDF">
        <html>
            <head>
                <title>Lab 3 feed</title>
            </head>
            <body>
                <xsl:apply-templates select="/rdf:RDF/rss:item"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="rdf:RDF/rss:item">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="rss:link"/>
            </xsl:attribute>
            <h2><xsl:value-of select="rss:title"/></h2>
        </xsl:element>
        <p><xsl:value-of select="rss:description"/></p>
    </xsl:template>

</xsl:stylesheet>

