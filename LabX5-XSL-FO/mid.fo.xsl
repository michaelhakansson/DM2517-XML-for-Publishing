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
       master-name="example-page-master"
       margin-right="2.1cm"
       margin-left="2.1cm"
       margin-bottom="3.54cm"
       margin-top="3.54cm"
       page-width="21.0cm"
       page-height="29.7cm">
       <fo:region-body
         margin-top="2cm"
         margin-bottom="2cm"
         column-count="2"
         column-gap="1cm"/>
         <fo:region-before extent="2cm" region-name="region-before-with-explicit-name"/>
         <fo:region-after extent="1.5cm"/>
       </fo:simple-page-master>
     </fo:layout-master-set>

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

   <fo:page-sequence master-reference="example-page-master">
     <fo:static-content flow-name="xsl-region-after">
       <fo:block> 
         <xsl:text>Efter</xsl:text>
       </fo:block>
     </fo:static-content>

     <fo:static-content flow-name="region-before-with-explicit-name">
       <fo:block> 
        <xsl:text>Innan</xsl:text>
      </fo:block>
    </fo:static-content>

    <fo:flow flow-name="xsl-region-body">
      <fo:block>
       <xsl:apply-templates select="ACT/SCENE/SPEECH/LINE"/>
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

<xsl:template match="SPEECH/LINE">
  <fo:block text-align="center">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="*">
</xsl:template>


</xsl:stylesheet>
