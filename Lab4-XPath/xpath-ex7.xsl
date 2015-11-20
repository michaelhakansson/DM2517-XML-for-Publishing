<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:key name="name" match="//PERSONELECTION/@NAME[contains(.,'R')]" use="." />
    <xsl:template match="node()|@*">
        <xsl:apply-templates select="node()|@*"/>
    </xsl:template>
    <xsl:template match="//PERSONELECTION/@NAME[generate-id()=generate-id(key('name',.)[1])]">
        <p><xsl:value-of select="."/></p>
    </xsl:template>
</xsl:stylesheet>
