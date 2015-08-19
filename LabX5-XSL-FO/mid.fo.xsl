<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:fo="http://www.w3.org/1999/XSL/Format">

 <xsl:template match="PLAY">
  <fo:root>
    <fo:layout-master-set>

      <fo:simple-page-master 
        master-name="frontpage"
        page-width="21.0cm"
        page-height="29.7cm"
        margin-top="3.54cm"
        margin-bottom="3.54cm"
        >
       <fo:region-body/>
     </fo:simple-page-master>

     <fo:simple-page-master 
        master-name="dramatis-personae"
        page-width="21.0cm"
        page-height="29.7cm"
        margin-top="3.54cm"
        margin-bottom="3.54cm"
        >
       <fo:region-body
        column-count="2"
        column-gap="-30mm"
        />
     </fo:simple-page-master>

     </fo:layout-master-set>


    <!-- FRONTPAGE -->
    <fo:page-sequence master-reference="frontpage">
      <fo:flow flow-name="xsl-region-body">
        <fo:block-container height="35mm">
          <fo:block
            text-align="center"
            font-family="Times"
            font-size="18pt"
            font-style="italic"
            >
            VOLUME <xsl:apply-templates select="@volume"/>
            BOOK <xsl:apply-templates select="@book"/>
          </fo:block>
        </fo:block-container>
        <fo:block text-align="center">
          <xsl:apply-templates select="MAINTITLE"/>
          <!-- IMAGE -->
          <fo:external-graphic src="shakespeare.jpg"
            content-height="scale-to-fit" 
            height="155mm"  
            content-width="127mm" 
            scaling="non-uniform"/>

            <xsl:apply-templates select="WRITER"/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>

    <!-- CHARACTER PAGE -->
    <fo:page-sequence master-reference="dramatis-personae">


      <fo:flow flow-name="xsl-region-body">

        <xsl:apply-templates select="PERSONAE"/>
      
        <fo:block
          text-align="center"
          font-family="Times"
          font-size="12pt"
          span="all"
          height="50mm"
          margin-top="5mm"
          margin-bottom="35.4mm">
          TEST
        </fo:block>
      </fo:flow>
      
    </fo:page-sequence>

</fo:root>
</xsl:template>

<xsl:template match="MAINTITLE">
  <fo:block
    text-align="center"
    font-family="Times"
    font-size="33pt">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="WRITER">
  <fo:block 
    text-align="center"
    font-family="Times"
    font-style="italic"
    font-size="18pt"
    padding-top="-.9pt">
    By <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="PERSONAE">
    <xsl:apply-templates select="TITLE"/>
    <xsl:apply-templates select="PERSONA | PGROUP"/>
  </xsl:template>

<xsl:template match="TITLE">
  <fo:block-container height="55mm" span="all">
    <fo:block
      text-align="center"
      font-family="Times"
      font-size="18pt"
      font-style="italic">
      <xsl:apply-templates/>
    </fo:block>
  </fo:block-container>
</xsl:template>

<xsl:template match="PERSONA">
    <fo:block
      text-align="center"
      font-family="Times"
      font-size="10pt"
      margin-bottom="10pt">
      <xsl:apply-templates/>
    </fo:block>
</xsl:template>

<xsl:template match="PGROUP">


<fo:table>
  <fo:table-column column-width="20mm" column-gap="10mm" border-left-color="green" border-left-width="0.5pt" border-left-style="solid"/>



    <fo:table-body>
    <fo:table-row>
      <fo:table-cell>
        <fo:block text-align="center">
        table columns
        </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block text-align="center">
        with
        </fo:block>
      </fo:table-cell>
    </fo:table-row>

  </fo:table-body>
      </fo:table>


  <fo:block>
    <xsl:for-each select="PERSONA">
      <fo:block border-right-style="solid">
        <xsl:apply-templates select="." />
      </fo:block>
    </xsl:for-each>
    <xsl:apply-templates select="GRPDESCR"/>
  </fo:block>
</xsl:template>

<xsl:template match="GRPDESCR">
    <fo:block
      text-align="center"
      font-family="Times"
      font-size="10pt">
      <xsl:apply-templates/>
    </fo:block>
</xsl:template>


<xsl:template match="SPEECH/LINE">
  <fo:block text-align="center">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="*">
</xsl:template>


</xsl:stylesheet>
