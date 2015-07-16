<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>


<!-- 
  Detta var den första lösninge, men det räcker inte för att få bort dubletterna:
  <xsl:template match="//PERSONELECTION">
    <p><xsl:apply-templates select="@NAME[contains(.,'Å')]" /></p>
  </xsl:template> -->


  <!-- Använder istället "Muenchian matchning" för att bli av med dubletterna. Har då en for-each, men hoppas att det är OK. -->
  <xsl:key name="name" match="//PERSONELECTION/@NAME[contains(.,'R')]" use="." />

  <xsl:template match="/">
    <xsl:for-each select="//PERSONELECTION/@NAME[generate-id()=generate-id(key('name',.)[1])]">
      <p><xsl:value-of select="."/></p>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>




