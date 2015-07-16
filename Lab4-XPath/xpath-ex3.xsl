<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

  <xsl:template match="ELECTION/MUNICIPALITY/CONSTITUENCY_MUNICIPALITY/ELECTORAL[VALID[@PARTY='M' and @PERCENTAGE>18]]">
    <p><xsl:apply-templates select="@NAME" /></p>
  </xsl:template>

</xsl:stylesheet>
