<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <!-- version 2 character sheet with horizontal main sheet, landscape spell sheet, final publish -->
  <xsl:template match="/">
    <xsl:processing-instruction name="mso-application">
      <xsl:text>progid="Word.Document"</xsl:text>
    </xsl:processing-instruction>
    <!-- variable $spaces used to fill space, where fields of different lengths would move other formatting elements. I should probably redo the template with tab stops or fixed formatting instead of spaces, but, well, here we are. -->
    <xsl:variable name="spaces">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:variable>
    <!-- variable $lines used to fill space in inventory entries. -->
    <xsl:variable name="lines">____________________</xsl:variable>

    <pkg:package xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage">
      <pkg:part pkg:name="/_rels/.rels" pkg:contentType="application/vnd.openxmlformats-package.relationships+xml" pkg:padding="512">
        <pkg:xmlData>
          <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
            <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
            <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
            <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
          </Relationships>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/_rels/document.xml.rels" pkg:contentType="application/vnd.openxmlformats-package.relationships+xml" pkg:padding="256">
        <pkg:xmlData>
          <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
            <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
            <Relationship Id="rId7" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme" Target="theme/theme1.xml"/>
            <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/numbering" Target="numbering.xml"/>
            <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/customXml" Target="../customXml/item1.xml"/>
            <Relationship Id="rId6" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable" Target="fontTable.xml"/>
            <Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/webSettings" Target="webSettings.xml"/>
            <Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings" Target="settings.xml"/>
          </Relationships>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/document.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml">
        <pkg:xmlData>
          <w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:cx="http://schemas.microsoft.com/office/drawing/2014/chartex" xmlns:cx1="http://schemas.microsoft.com/office/drawing/2015/9/8/chartex" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" mc:Ignorable="w14 w15 w16se wp14">
            <w:body>
              <xsl:for-each select="chargen/character">
                <xsl:variable name="invcount" select="count(props/invlist/item)"/>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="substring(concat(fluff/name, $spaces), 1, 26)"/>
                    </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="fluff/gender"/>
                    </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">     STR: <xsl:value-of select ="format-number(stats/STR, '00')"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="8"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"><xsl:value-of select="substring(concat(base/race, ' ', base/class, $spaces), 1, 32)"/>CON: <xsl:value-of select="format-number(stats/CON, '00')"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="8"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="substring(concat(fluff/age, ' years old, ', fluff/ht, '&quot;, ', fluff/wt, ' lbs', $spaces), 1, 32)"/>INT: <xsl:value-of select="format-number(stats/INT, '00')"/>
                    </w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="8"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="substring(concat(fluff/align, $spaces), 1, 32)"/>WIS: <xsl:value-of select="format-number(stats/WIS, '00')"/>
                    </w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="8"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="substring(concat('Doors ', attrib/doors, ', LGBB ', attrib/lgbb, $spaces), 1, 32)"/>DEX: <xsl:value-of select="format-number(stats/DEX, '00')"/>
                    </w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="8"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"><xsl:value-of select="substring($spaces, 1, 32)"/>CHA: <xsl:value-of select="format-number(stats/CHA, '00')"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">    │     │       1    2    3    4    5</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>HP:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> │     │ MAX: <xsl:value-of select="format-number(attrib/hpval/hp1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp5, '00')"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">    │     │</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">    │     │       A   Sh   Dg    O    O</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:bookmarkStart w:id="0" w:name="_GoBack"/>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>AC</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> │     │ 10 + <xsl:value-of select="format-number(attrib/ac/armorac, ' 0;-0')"/>&#160;+&#160;<xsl:value-of select="format-number(attrib/ac/shieldac, ' 0;-0')"/>&#160;+&#160;<xsl:value-of select="format-number(attrib/ac/dexac, ' 0;-0')"/>&#160;+&#160;&#160;&#160;&#160;+&#160;</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">    │     │</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">                  1    2    3    4    5</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">To-Hit:          </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="attrib/thac0/thac01"/>&#160;&#160;&#160;<xsl:value-of select="attrib/thac0/thac02"/>&#160;&#160;&#160;<xsl:value-of select="attrib/thac0/thac03"/>&#160;&#160;&#160;<xsl:value-of select="attrib/thac0/thac04"/>&#160;&#160;&#160;<xsl:value-of select="attrib/thac0/thac05"/>
                    </w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> W-DIE: <xsl:value-of select="props/wdie"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">DAMAGE: <xsl:value-of select="attrib/damage"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> BONUS:</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:top w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="24"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t xml:space="preserve">AMMO:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="24"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> □□□□□ □□□□□  □□□□□ □□□□□</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>SAVES:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">            1    2    3    4    5</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">        Poison:  <xsl:value-of select="concat(format-number(saves/poison/pois1, '00'), '   ', format-number(saves/poison/pois2, '00'), '   ', format-number(saves/poison/pois3, '00'), '   ', format-number(saves/poison/pois4, '00'), '   ', format-number(saves/poison/pois5, '00'))"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">       Petrify:  <xsl:value-of select="concat(format-number(saves/petrify/petr1, '00'), '   ', format-number(saves/petrify/petr2, '00'), '   ', format-number(saves/petrify/petr3, '00'), '   ', format-number(saves/petrify/petr4, '00'), '   ', format-number(saves/petrify/petr5, '00'))"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">          Wand:  <xsl:value-of select="concat(format-number(saves/wand/wand1, '00'), '   ', format-number(saves/wand/wand2, '00'), '   ', format-number(saves/wand/wand3, '00'), '   ', format-number(saves/wand/wand4, '00'), '   ', format-number(saves/wand/wand5, '00'))"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">        Breath:  <xsl:value-of select="concat(format-number(saves/breath/brea1, '00'), '   ', format-number(saves/breath/brea2, '00'), '   ', format-number(saves/breath/brea3, '00'), '   ', format-number(saves/breath/brea4, '00'), '   ', format-number(saves/breath/brea5, '00'))"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">         Spell:  <xsl:value-of select="concat(format-number(saves/spell/spel1, '00'), '   ', format-number(saves/spell/spel2, '00'), '   ', format-number(saves/spell/spel3, '00'), '   ', format-number(saves/spell/spel4, '00'), '   ', format-number(saves/spell/spel5, '00'))"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>INVENTORY:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">                Gold: <xsl:value-of select="props/gold"/></w:t>
                    <!-- Inventory template loops through items, then fills in blank spaces to make 6 rows of 2 blanks. -->
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="8"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <xsl:for-each select="props/invlist/item">
                  <w:p>
                    <w:pPr>
                      <w:pBdr>
                        <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      </w:pBdr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>

                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                        <w:szCs w:val="20"/>
                        <w:u w:val="single"/>
                      </w:rPr>
                      <w:t xml:space="preserve"><xsl:value-of select="substring(concat(text(), $lines), 1, 19)"/></w:t>
                    </w:r>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t>&#160;&#160;__________________</w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:pBdr>
                        <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      </w:pBdr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="8"/>
                      </w:rPr>
                    </w:pPr>
                  </w:p>
                </xsl:for-each>
                <xsl:for-each select="(//*)[position() &lt;= (6 - $invcount)]">
                  <w:p>
                    <w:pPr>
                      <w:pBdr>
                        <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      </w:pBdr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">___________________&#160;&#160;__________________</w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:pBdr>
                        <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      </w:pBdr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="8"/>
                      </w:rPr>
                    </w:pPr>
                  </w:p>
                </xsl:for-each>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:top w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">    │       │    2      3      4      5</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:top w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>XP:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> │       │ </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"><xsl:value-of select="concat(format-number(base/xp/xp2, '0000'), '   ', format-number(base/xp/xp3, '0000'), '   ', format-number(base/xp/xp4, '0000'), '   ', format-number(base/xp/xp5, '0000'))"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:top w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">    │       │</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:br w:type="column"/>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:lastRenderedPageBreak/>
                    <w:t>FEATURES:</w:t>
                  </w:r>
                </w:p>
                <xsl:for-each select="base/features/feature">
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                        <w:szCs w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                        <w:szCs w:val="20"/>
                      </w:rPr>
                      <w:t>
                        <xsl:value-of select="text()"/>
                      </w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="10"/>
                        <w:szCs w:val="10"/>
                      </w:rPr>
                    </w:pPr>
                  </w:p>
                </xsl:for-each>
                <xsl:if test="base/skilled = 1">
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">                 1    2    3    4    5</w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">     Pockets:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/pockets/pock1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/pockets/pock2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/pockets/pock3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/pockets/pock4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/pockets/pock5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">       Locks:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/locks/lock1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/locks/lock2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/locks/lock3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/locks/lock4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/locks/lock5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">       Traps:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/traps/trap1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/traps/trap2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/traps/trap3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/traps/trap4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/traps/trap5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">       Sneak:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/sneak/sneak1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/sneak/sneak2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/sneak/sneak3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/sneak/sneak4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/sneak/sneak5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">        Hide:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/hide/hide1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/hide/hide2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/hide/hide3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/hide/hide4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/hide/hide5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">      Listen:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/listen/listen1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/listen/listen2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/listen/listen3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/listen/listen4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/listen/listen5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">       Climb:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/climb/climb1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/climb/climb2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/climb/climb3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/climb/climb4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/climb/climb5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="20"/>
                      </w:rPr>
                      <w:t xml:space="preserve">        Read:&#160;&#160;&#160;<xsl:value-of select="format-number(skills/read/read1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/read/read2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/read/read3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/read/read4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(skills/read/read5, '00')"/></w:t>
                    </w:r>
                  </w:p>
                </xsl:if>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="18"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:br w:type="column"/>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:lastRenderedPageBreak/>
                    <w:t>BASIC RULES:</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>Tell the DM what you want to do. They will tell you what happens.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>Write in pencil. Nothing is permanent.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>To ATTACK, roll d20 and add your target’s AC.</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> Compare the total to your TO-HIT number</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>; eq</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>ual or higher hits. If a hit, roll W-DIE and add DAMAGE</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> and any BONUS that is applicable</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>Ranged weapons use AMMO. One BAG or QUIVER holds 20 AMMO and takes up one inventory slot. Use the</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> ammo</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> counter to keep track.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>If the DM tells you to SAVE, roll d20. Compare to the correct type of SAVE. Equal or higher succeeds.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>Roll d6 to OPEN DOORS or d100 to LIFT GATES / BEND BARS. Equal or lower succeeds. You only get one try.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>If the DM tells you to roll a stat, roll d20. Equal to or lower than your stat value succeeds.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>NOTES:</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:sectPr>
                      <w:pgSz w:w="15840" w:h="12240" w:orient="landscape"/>
                      <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                      <w:cols w:num="3" w:sep="1" w:space="720"/>
                      <w:docGrid w:linePitch="360"/>
                    </w:sectPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="16"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="16"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="16"/>
                    </w:rPr>
                  </w:pPr>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:sectPr>
                      <w:type w:val="continuous"/>
                      <w:pgSz w:w="15840" w:h="12240" w:orient="landscape"/>
                      <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                      <w:cols w:sep="1" w:space="720"/>
                      <w:docGrid w:linePitch="360"/>
                    </w:sectPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>WHAT WAS YOUR FATE?</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve"> ______________________________________________________________________________________________________________</w:t>
                  </w:r>
                </w:p>

                <w:sectPr>
                  <w:type w:val="continuous"/>
                  <w:pgSz w:w="12240" w:h="15840"/>
                  <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                  <w:cols w:space="720"/>
                  <w:docGrid w:linePitch="720"/>
                </w:sectPr>
                <xsl:if test="base/caster = 1">
                  <w:p>
                    <w:pPr>
                      <w:pBdr>
                        <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      </w:pBdr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:jc w:val="center"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:u w:val="single"/>
                      </w:rPr>
                    </w:r>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      </w:rPr>
                      <w:lastRenderedPageBreak/>
                      <w:t>SPELL REFERENCE SHEET</w:t>
                    </w:r>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      </w:rPr>
                      <w:sectPr>
                        <w:type w:val="continuous"/>
                        <w:pgSz w:w="12240" w:h="15840"/>
                        <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                        <w:cols w:space="720"/>
                        <w:docGrid w:linePitch="360"/>
                      </w:sectPr>
                    </w:pPr>
                  </w:p>
                  <xsl:for-each select="spells/L1/spell">
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:lastRenderedPageBreak/>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 1, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve"> Cast Time: <xsl:value-of select="s_cast"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 18, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">  Duration: <xsl:value-of select="s_dura"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">                           Save: <xsl:value-of select="s_save"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r w:rsidRPr="00910871">
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t>
                          <xsl:value-of select="s_text"/>
                        </w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                  </xsl:for-each>
                  <xsl:for-each select="spells/L2/spell">
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 1, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve"> Cast Time: <xsl:value-of select="s_cast"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 18, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">  Duration: <xsl:value-of select="s_dura"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">                           Save: <xsl:value-of select="s_save"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t>
                          <xsl:value-of select="s_text"/>
                        </w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                  </xsl:for-each>
                  <xsl:for-each select="spells/L3/spell">
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 1, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve"> Cast Time: <xsl:value-of select="s_cast"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 18, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">  Duration: <xsl:value-of select="s_dura"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">                           Save: <xsl:value-of select="s_save"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t>
                          <xsl:value-of select="s_text"/>
                        </w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                  </xsl:for-each>
                  <xsl:for-each select="spells/L4/spell">
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 1, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve"> Cast Time: <xsl:value-of select="s_cast"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 18, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">  Duration: <xsl:value-of select="s_dura"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">                           Save: <xsl:value-of select="s_save"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t>
                          <xsl:value-of select="s_text"/>
                        </w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9"/>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                  </xsl:for-each>
                  <xsl:for-each select="spells/L5/spell">
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 1, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve"> Cast Time: <xsl:value-of select="s_cast"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:b/>
                        </w:rPr>
                        <w:t xml:space="preserve"><xsl:value-of select="substring(concat(s_name, $spaces), 18, 17)"/></w:t>
                      </w:r>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">  Duration: <xsl:value-of select="s_dura"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                          <w:szCs w:val="18"/>
                        </w:rPr>
                        <w:t xml:space="preserve">                           Save: <xsl:value-of select="s_save"/></w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                      <w:r>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                        <w:t>
                          <xsl:value-of select="s_text"/>
                        </w:t>
                      </w:r>
                    </w:p>
                    <w:p>
                      <w:pPr>
                        <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                        <w:rPr>
                          <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                          <w:sz w:val="18"/>
                        </w:rPr>
                      </w:pPr>
                    </w:p>
                  </xsl:for-each>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="18"/>
                      </w:rPr>
                    </w:pPr>
                  </w:p>
                  <w:p>
                    <w:pPr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:sz w:val="18"/>
                      </w:rPr>
                      <w:sectPr>
                        <w:type w:val="continuous"/>
                        <w:pgSz w:w="12240" w:h="15840"/>
                        <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                        <w:cols w:num="2" w:space="720"/>
                        <w:docGrid w:linePitch="360"/>
                      </w:sectPr>
                    </w:pPr>
                  </w:p>
                  <w:sectPr>
                    <w:pgSz w:w="12240" w:h="15840"/>
                    <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                    <w:cols w:space="720"/>
                    <w:docGrid w:linePitch="720"/>
                  </w:sectPr>
                </xsl:if>
              </xsl:for-each>
            </w:body>
          </w:document>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/theme/theme1.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.theme+xml">
        <pkg:xmlData>
          <a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="Office Theme">
            <a:themeElements>
              <a:clrScheme name="Office">
                <a:dk1>
                  <a:sysClr val="windowText" lastClr="000000"/>
                </a:dk1>
                <a:lt1>
                  <a:sysClr val="window" lastClr="FFFFFF"/>
                </a:lt1>
                <a:dk2>
                  <a:srgbClr val="44546A"/>
                </a:dk2>
                <a:lt2>
                  <a:srgbClr val="E7E6E6"/>
                </a:lt2>
                <a:accent1>
                  <a:srgbClr val="5B9BD5"/>
                </a:accent1>
                <a:accent2>
                  <a:srgbClr val="ED7D31"/>
                </a:accent2>
                <a:accent3>
                  <a:srgbClr val="A5A5A5"/>
                </a:accent3>
                <a:accent4>
                  <a:srgbClr val="FFC000"/>
                </a:accent4>
                <a:accent5>
                  <a:srgbClr val="4472C4"/>
                </a:accent5>
                <a:accent6>
                  <a:srgbClr val="70AD47"/>
                </a:accent6>
                <a:hlink>
                  <a:srgbClr val="0563C1"/>
                </a:hlink>
                <a:folHlink>
                  <a:srgbClr val="954F72"/>
                </a:folHlink>
              </a:clrScheme>
              <a:fontScheme name="Office">
                <a:majorFont>
                  <a:latin typeface="Calibri Light" panose="020F0302020204030204"/>
                  <a:ea typeface=""/>
                  <a:cs typeface=""/>
                  <a:font script="Jpan" typeface="游ゴシック Light"/>
                  <a:font script="Hang" typeface="맑은 고딕"/>
                  <a:font script="Hans" typeface="等线 Light"/>
                  <a:font script="Hant" typeface="新細明體"/>
                  <a:font script="Arab" typeface="Times New Roman"/>
                  <a:font script="Hebr" typeface="Times New Roman"/>
                  <a:font script="Thai" typeface="Angsana New"/>
                  <a:font script="Ethi" typeface="Nyala"/>
                  <a:font script="Beng" typeface="Vrinda"/>
                  <a:font script="Gujr" typeface="Shruti"/>
                  <a:font script="Khmr" typeface="MoolBoran"/>
                  <a:font script="Knda" typeface="Tunga"/>
                  <a:font script="Guru" typeface="Raavi"/>
                  <a:font script="Cans" typeface="Euphemia"/>
                  <a:font script="Cher" typeface="Plantagenet Cherokee"/>
                  <a:font script="Yiii" typeface="Microsoft Yi Baiti"/>
                  <a:font script="Tibt" typeface="Microsoft Himalaya"/>
                  <a:font script="Thaa" typeface="MV Boli"/>
                  <a:font script="Deva" typeface="Mangal"/>
                  <a:font script="Telu" typeface="Gautami"/>
                  <a:font script="Taml" typeface="Latha"/>
                  <a:font script="Syrc" typeface="Estrangelo Edessa"/>
                  <a:font script="Orya" typeface="Kalinga"/>
                  <a:font script="Mlym" typeface="Kartika"/>
                  <a:font script="Laoo" typeface="DokChampa"/>
                  <a:font script="Sinh" typeface="Iskoola Pota"/>
                  <a:font script="Mong" typeface="Mongolian Baiti"/>
                  <a:font script="Viet" typeface="Times New Roman"/>
                  <a:font script="Uigh" typeface="Microsoft Uighur"/>
                  <a:font script="Geor" typeface="Sylfaen"/>
                </a:majorFont>
                <a:minorFont>
                  <a:latin typeface="Calibri" panose="020F0502020204030204"/>
                  <a:ea typeface=""/>
                  <a:cs typeface=""/>
                  <a:font script="Jpan" typeface="游明朝"/>
                  <a:font script="Hang" typeface="맑은 고딕"/>
                  <a:font script="Hans" typeface="等线"/>
                  <a:font script="Hant" typeface="新細明體"/>
                  <a:font script="Arab" typeface="Arial"/>
                  <a:font script="Hebr" typeface="Arial"/>
                  <a:font script="Thai" typeface="Cordia New"/>
                  <a:font script="Ethi" typeface="Nyala"/>
                  <a:font script="Beng" typeface="Vrinda"/>
                  <a:font script="Gujr" typeface="Shruti"/>
                  <a:font script="Khmr" typeface="DaunPenh"/>
                  <a:font script="Knda" typeface="Tunga"/>
                  <a:font script="Guru" typeface="Raavi"/>
                  <a:font script="Cans" typeface="Euphemia"/>
                  <a:font script="Cher" typeface="Plantagenet Cherokee"/>
                  <a:font script="Yiii" typeface="Microsoft Yi Baiti"/>
                  <a:font script="Tibt" typeface="Microsoft Himalaya"/>
                  <a:font script="Thaa" typeface="MV Boli"/>
                  <a:font script="Deva" typeface="Mangal"/>
                  <a:font script="Telu" typeface="Gautami"/>
                  <a:font script="Taml" typeface="Latha"/>
                  <a:font script="Syrc" typeface="Estrangelo Edessa"/>
                  <a:font script="Orya" typeface="Kalinga"/>
                  <a:font script="Mlym" typeface="Kartika"/>
                  <a:font script="Laoo" typeface="DokChampa"/>
                  <a:font script="Sinh" typeface="Iskoola Pota"/>
                  <a:font script="Mong" typeface="Mongolian Baiti"/>
                  <a:font script="Viet" typeface="Arial"/>
                  <a:font script="Uigh" typeface="Microsoft Uighur"/>
                  <a:font script="Geor" typeface="Sylfaen"/>
                </a:minorFont>
              </a:fontScheme>
              <a:fmtScheme name="Office">
                <a:fillStyleLst>
                  <a:solidFill>
                    <a:schemeClr val="phClr"/>
                  </a:solidFill>
                  <a:gradFill rotWithShape="1">
                    <a:gsLst>
                      <a:gs pos="0">
                        <a:schemeClr val="phClr">
                          <a:lumMod val="110000"/>
                          <a:satMod val="105000"/>
                          <a:tint val="67000"/>
                        </a:schemeClr>
                      </a:gs>
                      <a:gs pos="50000">
                        <a:schemeClr val="phClr">
                          <a:lumMod val="105000"/>
                          <a:satMod val="103000"/>
                          <a:tint val="73000"/>
                        </a:schemeClr>
                      </a:gs>
                      <a:gs pos="100000">
                        <a:schemeClr val="phClr">
                          <a:lumMod val="105000"/>
                          <a:satMod val="109000"/>
                          <a:tint val="81000"/>
                        </a:schemeClr>
                      </a:gs>
                    </a:gsLst>
                    <a:lin ang="5400000" scaled="0"/>
                  </a:gradFill>
                  <a:gradFill rotWithShape="1">
                    <a:gsLst>
                      <a:gs pos="0">
                        <a:schemeClr val="phClr">
                          <a:satMod val="103000"/>
                          <a:lumMod val="102000"/>
                          <a:tint val="94000"/>
                        </a:schemeClr>
                      </a:gs>
                      <a:gs pos="50000">
                        <a:schemeClr val="phClr">
                          <a:satMod val="110000"/>
                          <a:lumMod val="100000"/>
                          <a:shade val="100000"/>
                        </a:schemeClr>
                      </a:gs>
                      <a:gs pos="100000">
                        <a:schemeClr val="phClr">
                          <a:lumMod val="99000"/>
                          <a:satMod val="120000"/>
                          <a:shade val="78000"/>
                        </a:schemeClr>
                      </a:gs>
                    </a:gsLst>
                    <a:lin ang="5400000" scaled="0"/>
                  </a:gradFill>
                </a:fillStyleLst>
                <a:lnStyleLst>
                  <a:ln w="6350" cap="flat" cmpd="sng" algn="ctr">
                    <a:solidFill>
                      <a:schemeClr val="phClr"/>
                    </a:solidFill>
                    <a:prstDash val="solid"/>
                    <a:miter lim="800000"/>
                  </a:ln>
                  <a:ln w="12700" cap="flat" cmpd="sng" algn="ctr">
                    <a:solidFill>
                      <a:schemeClr val="phClr"/>
                    </a:solidFill>
                    <a:prstDash val="solid"/>
                    <a:miter lim="800000"/>
                  </a:ln>
                  <a:ln w="19050" cap="flat" cmpd="sng" algn="ctr">
                    <a:solidFill>
                      <a:schemeClr val="phClr"/>
                    </a:solidFill>
                    <a:prstDash val="solid"/>
                    <a:miter lim="800000"/>
                  </a:ln>
                </a:lnStyleLst>
                <a:effectStyleLst>
                  <a:effectStyle>
                    <a:effectLst/>
                  </a:effectStyle>
                  <a:effectStyle>
                    <a:effectLst/>
                  </a:effectStyle>
                  <a:effectStyle>
                    <a:effectLst>
                      <a:outerShdw blurRad="57150" dist="19050" dir="5400000" algn="ctr" rotWithShape="0">
                        <a:srgbClr val="000000">
                          <a:alpha val="63000"/>
                        </a:srgbClr>
                      </a:outerShdw>
                    </a:effectLst>
                  </a:effectStyle>
                </a:effectStyleLst>
                <a:bgFillStyleLst>
                  <a:solidFill>
                    <a:schemeClr val="phClr"/>
                  </a:solidFill>
                  <a:solidFill>
                    <a:schemeClr val="phClr">
                      <a:tint val="95000"/>
                      <a:satMod val="170000"/>
                    </a:schemeClr>
                  </a:solidFill>
                  <a:gradFill rotWithShape="1">
                    <a:gsLst>
                      <a:gs pos="0">
                        <a:schemeClr val="phClr">
                          <a:tint val="93000"/>
                          <a:satMod val="150000"/>
                          <a:shade val="98000"/>
                          <a:lumMod val="102000"/>
                        </a:schemeClr>
                      </a:gs>
                      <a:gs pos="50000">
                        <a:schemeClr val="phClr">
                          <a:tint val="98000"/>
                          <a:satMod val="130000"/>
                          <a:shade val="90000"/>
                          <a:lumMod val="103000"/>
                        </a:schemeClr>
                      </a:gs>
                      <a:gs pos="100000">
                        <a:schemeClr val="phClr">
                          <a:shade val="63000"/>
                          <a:satMod val="120000"/>
                        </a:schemeClr>
                      </a:gs>
                    </a:gsLst>
                    <a:lin ang="5400000" scaled="0"/>
                  </a:gradFill>
                </a:bgFillStyleLst>
              </a:fmtScheme>
            </a:themeElements>
            <a:objectDefaults/>
            <a:extraClrSchemeLst/>
          </a:theme>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/settings.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml">
        <pkg:xmlData>
          <w:settings xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" xmlns:sl="http://schemas.openxmlformats.org/schemaLibrary/2006/main" mc:Ignorable="w14 w15 w16se">
            <w:zoom w:percent="100"/>
            <w:proofState w:spelling="clean" w:grammar="clean"/>
            <w:stylePaneFormatFilter w:val="1728" w:allStyles="0" w:customStyles="0" w:latentStyles="0" w:stylesInUse="1" w:headingStyles="1" w:numberingStyles="0" w:tableStyles="0" w:directFormattingOnRuns="1" w:directFormattingOnParagraphs="1" w:directFormattingOnNumbering="1" w:directFormattingOnTables="0" w:clearFormatting="1" w:top3HeadingStyles="0" w:visibleStyles="0" w:alternateStyleNames="0"/>
            <w:doNotTrackMoves/>
            <w:defaultTabStop w:val="720"/>
            <w:characterSpacingControl w:val="doNotCompress"/>
            <w:compat>
              <w:useNormalStyleForList/>
              <w:doNotUseIndentAsNumberingTabStop/>
              <w:useAltKinsokuLineBreakRules/>
              <w:allowSpaceOfSameStyleInTable/>
              <w:doNotSuppressIndentation/>
              <w:doNotAutofitConstrainedTables/>
              <w:autofitToFirstFixedWidthCell/>
              <w:displayHangulFixedWidth/>
              <w:splitPgBreakAndParaMark/>
              <w:doNotVertAlignCellWithSp/>
              <w:doNotBreakConstrainedForcedTable/>
              <w:doNotVertAlignInTxbx/>
              <w:useAnsiKerningPairs/>
              <w:cachedColBalance/>
              <w:compatSetting w:name="compatibilityMode" w:uri="http://schemas.microsoft.com/office/word" w:val="11"/>
            </w:compat>
            <m:mathPr>
              <m:mathFont m:val="Cambria Math"/>
              <m:brkBin m:val="before"/>
              <m:brkBinSub m:val="--"/>
              <m:smallFrac m:val="0"/>
              <m:dispDef/>
              <m:lMargin m:val="0"/>
              <m:rMargin m:val="0"/>
              <m:defJc m:val="centerGroup"/>
              <m:wrapIndent m:val="1440"/>
              <m:intLim m:val="subSup"/>
              <m:naryLim m:val="undOvr"/>
            </m:mathPr>
            <w:themeFontLang w:val="en-US"/>
            <w:clrSchemeMapping w:bg1="light1" w:t1="dark1" w:bg2="light2" w:t2="dark2" w:accent1="accent1" w:accent2="accent2" w:accent3="accent3" w:accent4="accent4" w:accent5="accent5" w:accent6="accent6" w:hyperlink="hyperlink" w:followedHyperlink="followedHyperlink"/>
            <w:doNotIncludeSubdocsInStats/>
            <w:doNotAutoCompressPictures/>
            <w:shapeDefaults>
              <o:shapedefaults v:ext="edit" spidmax="1026"/>
              <o:shapelayout v:ext="edit">
                <o:idmap v:ext="edit" data="1"/>
              </o:shapelayout>
            </w:shapeDefaults>
            <w:decimalSymbol w:val="."/>
            <w:listSeparator w:val=","/>
            <w14:defaultImageDpi w14:val="0"/>
          </w:settings>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/docProps/core.xml" pkg:contentType="application/vnd.openxmlformats-package.core-properties+xml" pkg:padding="256">
        <pkg:xmlData>
          <cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <dc:title/>
            <dc:subject/>
            <dc:creator></dc:creator>
            <cp:keywords/>
            <dc:description/>
            <cp:lastModifiedBy></cp:lastModifiedBy>
            <cp:revision>2</cp:revision>
            <cp:lastPrinted>2015-08-19T01:20:00Z</cp:lastPrinted>
            <dcterms:created xsi:type="dcterms:W3CDTF">2015-09-11T04:51:00Z</dcterms:created>
            <dcterms:modified xsi:type="dcterms:W3CDTF">2015-09-11T04:51:00Z</dcterms:modified>
          </cp:coreProperties>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/customXml/item1.xml" pkg:contentType="application/xml" pkg:padding="32">
        <pkg:xmlData pkg:originalXmlStandalone="no">
          <b:Sources SelectedStyle="\APASixthEditionOfficeOnline.xsl" StyleName="APA" Version="6" xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography" xmlns="http://schemas.openxmlformats.org/officeDocument/2006/bibliography"/>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/docProps/app.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.extended-properties+xml" pkg:padding="256">
        <pkg:xmlData>
          <Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
            <Template>Normal.dotm</Template>
            <TotalTime>0</TotalTime>
            <Pages>2</Pages>
            <Words>388</Words>
            <Characters>2215</Characters>
            <Application>Microsoft Office Word</Application>
            <DocSecurity>0</DocSecurity>
            <Lines>18</Lines>
            <Paragraphs>5</Paragraphs>
            <ScaleCrop>false</ScaleCrop>
            <HeadingPairs>
              <vt:vector size="2" baseType="variant">
                <vt:variant>
                  <vt:lpstr>Title</vt:lpstr>
                </vt:variant>
                <vt:variant>
                  <vt:i4>1</vt:i4>
                </vt:variant>
              </vt:vector>
            </HeadingPairs>
            <TitlesOfParts>
              <vt:vector size="1" baseType="lpstr">
                <vt:lpstr/>
              </vt:vector>
            </TitlesOfParts>
            <Company/>
            <LinksUpToDate>false</LinksUpToDate>
            <CharactersWithSpaces>2598</CharactersWithSpaces>
            <SharedDoc>false</SharedDoc>
            <HyperlinksChanged>false</HyperlinksChanged>
            <AppVersion>16.0000</AppVersion>
          </Properties>
        </pkg:xmlData>
      </pkg:part>
    </pkg:package>
  </xsl:template>
</xsl:stylesheet>
