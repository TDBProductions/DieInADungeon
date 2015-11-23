<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <xsl:template match="/">

    <xsl:processing-instruction name="mso-application">
      <xsl:text>progid="Word.Document"</xsl:text>
    </xsl:processing-instruction>
    <!-- variable $spaces used to fill space, where fields of different lengths would move other formatting elements. I should probably redo the template with tab stops or fixed formatting instead of spaces, but, well, here we are. -->
    <xsl:variable name="spaces">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:variable>
    <!-- variable $lines used to fill space in inventory entries. -->
    <xsl:variable name="lines">____________________</xsl:variable>
    <!-- variable shortspace used to fill space in stat fields. -->
    <xsl:variable name="shortspace">&#160;&#160;</xsl:variable>
    <!-- variable fieldwide notes width of stat, save, and skill expected fields/entries. -->
    <xsl:variable name="fieldwide">2</xsl:variable>

    <?mso-application progid="Word.Document"?>
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
                    <w:t xml:space="preserve">     STR:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      <xsl:value-of select="format-number(stats/STR, '00')"/>
                    </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>0</w:t>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve"><xsl:value-of select="substring(concat(base/race, ' ', base/class, $spaces), 1, 32)"/></w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t>
                      CON: <xsl:value-of select="stats/CON"/>
                    </w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                      <xsl:value-of select="substring(concat(fluff/age, ' years old, ', fluff/height, '&quot;, ', fluff/weight, ' lbs', $spaces), 1, 32)"/>
                    </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">INT: <xsl:value-of select="stats/INT"/></w:t>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                      <xsl:value-of select="substring(concat(fluff/align, $spaces), 1, 32)"/>
                    </w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">WIS: <xsl:value-of select="stats/WIS"/></w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve"><xsl:value-of select="substring(concat('Doors ', attrib/doors, ' LGBB ', attrib/lgbb), 1, 32)"/></w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">DEX: <xsl:value-of select="stats/DEX"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve"><xsl:value-of select="substring($spaces, 1, 32)"/></w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">CHA: <xsl:value-of select="stats/CHA"/></w:t>
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
                    <w:t xml:space="preserve">HP:</w:t>
                  </w:r>
                  <w:rPr>
                    <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    <w:sz w:val="20"/>
                  </w:rPr>
                  <w:t>
                    &#160;│&#160;&#160;&#160;&#160;&#160;│&#160;MAX:&#160;<xsl:value-of select="format-number(attrib/hpval/hp1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(attrib/hpval/hp5, '00')"/>
                  </w:t>
                  <w:r>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t>AC:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <w:t xml:space="preserve">&#160;│&#160;&#160;&#160;&#160;&#160;│&#160;10&#160;+&#160;<xsl:value-of select="format-number(attrib/ac/armorac, '00;-0')"/>&#160;&#43;&#160;<xsl:value-of select="format-number(attrib/ac/shieldac, ' 0;-0')"/>&#160;&#43;&#160;<xsl:value-of select="format-number(attrib/ac/dexac, ' 0;-0')"/>&#160;&#43;&#160;&#160;&#160;&#160;&#43;</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                      <xsl:value-of select="attrib/thac0/thac01"/>&#160;&#160;<xsl:value-of select="attrib/thac0/thac02"/>&#160;&#160;<xsl:value-of select="attrib/thac0/thac03"/>&#160;&#160;<xsl:value-of select="attrib/thac0/thac04"/>&#160;&#160;<xsl:value-of select="attrib/thac0/thac05"/>&#160;&#160;
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
                    <w:t xml:space="preserve">AMMO: □□□□□ □□□□□  □□□□□ □□□□□</w:t>
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
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>SAVES:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                    <w:t xml:space="preserve">            1    2    3    4    5</w:t>
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
                      <w:sz w:val="10"/>
                      <w:szCs w:val="10"/>
                      <w:u w:val="single"/>
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
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                    <w:t xml:space="preserve">        Poison:&#160;&#160;<xsl:value-of select="format-number(saves/poison/pois1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/poison/pois2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/poison/pois3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/poison/pois4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/poison/pois5, '00')"/></w:t>
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
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                    <w:t xml:space="preserve">       Petrify:&#160;&#160;<xsl:value-of select="format-number(saves/petrify/petr1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/petrify/petr2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/petrify/petr3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/petrify/petr4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/petrify/petr5, '00')"/></w:t>
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
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                    <w:t xml:space="preserve">          Wand:  <xsl:value-of select="format-number(saves/wand/wand1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/wand/wand2,  '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/wand/wand3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/wand/wand4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/wand/wand5, '00')"/></w:t>
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
                    <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                    <w:t xml:space="preserve">        Breath:  <xsl:value-of select="format-number(saves/breath/brea1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/breath/brea2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/breath/brea3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/breath/brea4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/breath/brea5, '00')"/></w:t>
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
                    </w:rPr>
                  </w:pPr>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>

                    <w:t xml:space="preserve">         Spell:  <xsl:value-of select="format-number(saves/spell/spel1, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/spell/spel2, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/spell/spel3, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/spell/spel4, '00')"/>&#160;&#160;&#160;<xsl:value-of select="format-number(saves/spell/spel5, '00')"/></w:t>
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
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t xml:space="preserve">INVENTORY:</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                    </w:rPr>
                    <w:t xml:space="preserve">                Gold: <xsl:value-of select="props/gold"/></w:t>
                    <!-- Inventory template loops through items, then fills in blank spaces to make 6 rows of 2 blanks each. -->
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
                <xsl:for-each select="props/invlist/item">
                  <w:p>
                    <w:pPr>
                      <w:pBdr>
                        <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      </w:pBdr>
                      <w:spacing w:after="0" w:line="240" w:lineRule="auto"/>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                        <w:u w:val="single"/>
                      </w:rPr>
                      <w:t xml:space="preserve"><xsl:value-of select="substring(concat(text(), $lines), 1, 20)"/></w:t>
                    </w:r>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      </w:rPr>
                      <w:t>&#160;&#160;___________________</w:t>
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
                        <w:sz w:val="10"/>
                        <w:szCs w:val="10"/>
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
                      </w:rPr>
                    </w:pPr>
                    <w:r>
                      <w:rPr>
                        <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      </w:rPr>
                      <w:t xml:space="preserve">____________________&#160;&#160;___________________</w:t>
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
                        <w:sz w:val="10"/>
                        <w:szCs w:val="10"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve"> │       │</w:t>
                  </w:r>
                  <w:r>
                    <w:rPr>
                      <w:rFonts w:ascii="Consolas" w:hAnsi="Consolas" w:cs="Consolas"/>
                      <w:sz w:val="20"/>
                    </w:rPr>
                    <!-- commented because $xpval is not implemented yet. -->
                    <!--
                    <w:t xml:space="preserve"> <xsl:value-of select="format-number(base/xp/xp1, '0000')"/>   <xsl:value-of select="format-number(base/xp/xp2, '0000')"/>   <xsl:value-of select="format-number(base/xp/xp3, '0000')"/>   <xsl:value-of select="format-number(base/xp/xp4, '0000')"/></w:t>  
                    -->
                    <w:t xml:space="preserve"> 1000   2000   3000   4000</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:pBdr>
                      <w:top w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                      <w:bottom w:val="single" w:sz="6" w:space="1" w:color="auto"/>
                    </w:pBdr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                      <w:u w:val="single"/>
                    </w:rPr>
                    <w:t>FEATURES:</w:t>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve">Write in pencil. Nothing is permanent.</w:t>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve">To ATTACK, roll d20 and add your target’s AC. Compare the total to your TO-HIT number; equal or higher hits. If a hit, roll W-DIE and add DAMAGE and any BONUS that is applicable.</w:t>
                  </w:r>
                </w:p>
                <w:p>
                  <w:pPr>
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t>Ranged weapons use AMMO. One BAG or QUIVER holds 20 AMMO and takes up one inventory slot. Use the ammo counter to keep track.</w:t>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
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
                    <w:t xml:space="preserve">WHAT WAS YOUR FATE? ______________________________________________________________________________________________________________</w:t>
                  </w:r>
                </w:p>
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
                      <w:sectPr>
                        <w:pgSz w:w="12240" w:h="15840"/>
                        <w:pgMar w:top="720" w:right="720" w:bottom="720" w:left="720" w:header="720" w:footer="720" w:gutter="0"/>
                        <w:cols w:space="720"/>
                        <w:docGrid w:linePitch="360"/>
                      </w:sectPr>
                    </w:pPr>
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
                        </w:rPr>
                      </w:pPr>
                    </w:p>
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
                        </w:rPr>
                      </w:pPr>
                    </w:p>
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
            <a:extLst>
              <a:ext uri="05A4C25C-085E-4340-85A3-A5531E510DB2">
                <thm15:themeFamily xmlns:thm15="http://schemas.microsoft.com/office/thememl/2012/main" name="Office Theme" id="62F939B6-93AF-4DB8-9C6B-D6C7DFDC589F" vid="4A3C46E8-61CC-4603-A589-7422A47A8E4A"/>
              </a:ext>
            </a:extLst>
          </a:theme>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/settings.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml">
        <pkg:xmlData>
          <w:settings xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" xmlns:sl="http://schemas.openxmlformats.org/schemaLibrary/2006/main" mc:Ignorable="w14 w15 w16se">
            <w:zoom w:percent="100"/>
            <w:proofState w:spelling="clean" w:grammar="clean"/>
            <w:defaultTabStop w:val="720"/>
            <w:characterSpacingControl w:val="doNotCompress"/>
            <w:compat>
              <w:compatSetting w:name="compatibilityMode" w:uri="http://schemas.microsoft.com/office/word" w:val="15"/>
              <w:compatSetting w:name="overrideTableStyleFontSizeAndJustification" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/>
              <w:compatSetting w:name="enableOpenTypeFeatures" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/>
              <w:compatSetting w:name="doNotFlipMirrorIndents" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/>
              <w:compatSetting w:name="differentiateMultirowTableHeaders" w:uri="http://schemas.microsoft.com/office/word" w:val="1"/>
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
            <w:shapeDefaults>
              <o:shapedefaults v:ext="edit" spidmax="1026"/>
              <o:shapelayout v:ext="edit">
                <o:idmap v:ext="edit" data="1"/>
              </o:shapelayout>
            </w:shapeDefaults>
            <w:decimalSymbol w:val="."/>
            <w:listSeparator w:val=","/>
            <w15:chartTrackingRefBased/>
            <w15:docId w15:val="{A95163DD-F61A-4FC5-8B46-322C25B65B85}"/>
          </w:settings>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/styles.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml">
        <pkg:xmlData>
          <w:styles xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" mc:Ignorable="w14 w15 w16se">
            <w:docDefaults>
              <w:rPrDefault>
                <w:rPr>
                  <w:rFonts w:asciiTheme="minorHAnsi" w:eastAsiaTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorBidi"/>
                  <w:sz w:val="22"/>
                  <w:szCs w:val="22"/>
                  <w:lang w:val="en-US" w:eastAsia="en-US" w:bidi="ar-SA"/>
                </w:rPr>
              </w:rPrDefault>
              <w:pPrDefault>
                <w:pPr>
                  <w:spacing w:after="160" w:line="259" w:lineRule="auto"/>
                </w:pPr>
              </w:pPrDefault>
            </w:docDefaults>
            <w:latentStyles w:defLockedState="0" w:defUIPriority="99" w:defSemiHidden="0" w:defUnhideWhenUsed="0" w:defQFormat="0" w:count="371">
              <w:lsdException w:name="Normal" w:uiPriority="0" w:qFormat="1"/>
              <w:lsdException w:name="heading 1" w:uiPriority="9" w:qFormat="1"/>
              <w:lsdException w:name="heading 2" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 3" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 4" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 5" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 6" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 7" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 8" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="heading 9" w:semiHidden="1" w:uiPriority="9" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="index 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 6" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 7" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 8" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index 9" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 1" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 2" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 3" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 4" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 5" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 6" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 7" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 8" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toc 9" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Normal Indent" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="footnote text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="annotation text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="header" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="footer" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="index heading" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="caption" w:semiHidden="1" w:uiPriority="35" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="table of figures" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="envelope address" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="envelope return" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="footnote reference" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="annotation reference" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="line number" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="page number" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="endnote reference" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="endnote text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="table of authorities" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="macro" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="toa heading" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Bullet" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Number" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Bullet 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Bullet 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Bullet 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Bullet 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Number 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Number 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Number 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Number 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Title" w:uiPriority="10" w:qFormat="1"/>
              <w:lsdException w:name="Closing" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Signature" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Default Paragraph Font" w:semiHidden="1" w:uiPriority="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text Indent" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Continue" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Continue 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Continue 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Continue 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="List Continue 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Message Header" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Subtitle" w:uiPriority="11" w:qFormat="1"/>
              <w:lsdException w:name="Salutation" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Date" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text First Indent" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text First Indent 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Note Heading" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text Indent 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Body Text Indent 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Block Text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Hyperlink" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="FollowedHyperlink" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Strong" w:uiPriority="22" w:qFormat="1"/>
              <w:lsdException w:name="Emphasis" w:uiPriority="20" w:qFormat="1"/>
              <w:lsdException w:name="Document Map" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Plain Text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="E-mail Signature" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Top of Form" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Bottom of Form" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Normal (Web)" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Acronym" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Address" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Cite" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Code" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Definition" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Keyboard" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Preformatted" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Sample" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Typewriter" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="HTML Variable" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Normal Table" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="annotation subject" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="No List" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Outline List 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Outline List 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Outline List 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Simple 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Simple 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Simple 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Classic 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Classic 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Classic 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Classic 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Colorful 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Colorful 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Colorful 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Columns 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Columns 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Columns 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Columns 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Columns 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 6" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 7" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid 8" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 4" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 5" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 6" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 7" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table List 8" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table 3D effects 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table 3D effects 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table 3D effects 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Contemporary" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Elegant" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Professional" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Subtle 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Subtle 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Web 1" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Web 2" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Web 3" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Balloon Text" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Table Grid" w:uiPriority="39"/>
              <w:lsdException w:name="Table Theme" w:semiHidden="1" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="Placeholder Text" w:semiHidden="1"/>
              <w:lsdException w:name="No Spacing" w:uiPriority="1" w:qFormat="1"/>
              <w:lsdException w:name="Light Shading" w:uiPriority="60"/>
              <w:lsdException w:name="Light List" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1" w:uiPriority="65"/>
              <w:lsdException w:name="Medium List 2" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid" w:uiPriority="73"/>
              <w:lsdException w:name="Light Shading Accent 1" w:uiPriority="60"/>
              <w:lsdException w:name="Light List Accent 1" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid Accent 1" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1 Accent 1" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2 Accent 1" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1 Accent 1" w:uiPriority="65"/>
              <w:lsdException w:name="Revision" w:semiHidden="1"/>
              <w:lsdException w:name="List Paragraph" w:uiPriority="34" w:qFormat="1"/>
              <w:lsdException w:name="Quote" w:uiPriority="29" w:qFormat="1"/>
              <w:lsdException w:name="Intense Quote" w:uiPriority="30" w:qFormat="1"/>
              <w:lsdException w:name="Medium List 2 Accent 1" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1 Accent 1" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2 Accent 1" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3 Accent 1" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List Accent 1" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading Accent 1" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List Accent 1" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid Accent 1" w:uiPriority="73"/>
              <w:lsdException w:name="Light Shading Accent 2" w:uiPriority="60"/>
              <w:lsdException w:name="Light List Accent 2" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid Accent 2" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1 Accent 2" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2 Accent 2" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1 Accent 2" w:uiPriority="65"/>
              <w:lsdException w:name="Medium List 2 Accent 2" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1 Accent 2" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2 Accent 2" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3 Accent 2" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List Accent 2" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading Accent 2" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List Accent 2" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid Accent 2" w:uiPriority="73"/>
              <w:lsdException w:name="Light Shading Accent 3" w:uiPriority="60"/>
              <w:lsdException w:name="Light List Accent 3" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid Accent 3" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1 Accent 3" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2 Accent 3" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1 Accent 3" w:uiPriority="65"/>
              <w:lsdException w:name="Medium List 2 Accent 3" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1 Accent 3" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2 Accent 3" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3 Accent 3" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List Accent 3" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading Accent 3" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List Accent 3" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid Accent 3" w:uiPriority="73"/>
              <w:lsdException w:name="Light Shading Accent 4" w:uiPriority="60"/>
              <w:lsdException w:name="Light List Accent 4" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid Accent 4" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1 Accent 4" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2 Accent 4" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1 Accent 4" w:uiPriority="65"/>
              <w:lsdException w:name="Medium List 2 Accent 4" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1 Accent 4" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2 Accent 4" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3 Accent 4" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List Accent 4" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading Accent 4" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List Accent 4" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid Accent 4" w:uiPriority="73"/>
              <w:lsdException w:name="Light Shading Accent 5" w:uiPriority="60"/>
              <w:lsdException w:name="Light List Accent 5" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid Accent 5" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1 Accent 5" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2 Accent 5" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1 Accent 5" w:uiPriority="65"/>
              <w:lsdException w:name="Medium List 2 Accent 5" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1 Accent 5" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2 Accent 5" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3 Accent 5" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List Accent 5" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading Accent 5" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List Accent 5" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid Accent 5" w:uiPriority="73"/>
              <w:lsdException w:name="Light Shading Accent 6" w:uiPriority="60"/>
              <w:lsdException w:name="Light List Accent 6" w:uiPriority="61"/>
              <w:lsdException w:name="Light Grid Accent 6" w:uiPriority="62"/>
              <w:lsdException w:name="Medium Shading 1 Accent 6" w:uiPriority="63"/>
              <w:lsdException w:name="Medium Shading 2 Accent 6" w:uiPriority="64"/>
              <w:lsdException w:name="Medium List 1 Accent 6" w:uiPriority="65"/>
              <w:lsdException w:name="Medium List 2 Accent 6" w:uiPriority="66"/>
              <w:lsdException w:name="Medium Grid 1 Accent 6" w:uiPriority="67"/>
              <w:lsdException w:name="Medium Grid 2 Accent 6" w:uiPriority="68"/>
              <w:lsdException w:name="Medium Grid 3 Accent 6" w:uiPriority="69"/>
              <w:lsdException w:name="Dark List Accent 6" w:uiPriority="70"/>
              <w:lsdException w:name="Colorful Shading Accent 6" w:uiPriority="71"/>
              <w:lsdException w:name="Colorful List Accent 6" w:uiPriority="72"/>
              <w:lsdException w:name="Colorful Grid Accent 6" w:uiPriority="73"/>
              <w:lsdException w:name="Subtle Emphasis" w:uiPriority="19" w:qFormat="1"/>
              <w:lsdException w:name="Intense Emphasis" w:uiPriority="21" w:qFormat="1"/>
              <w:lsdException w:name="Subtle Reference" w:uiPriority="31" w:qFormat="1"/>
              <w:lsdException w:name="Intense Reference" w:uiPriority="32" w:qFormat="1"/>
              <w:lsdException w:name="Book Title" w:uiPriority="33" w:qFormat="1"/>
              <w:lsdException w:name="Bibliography" w:semiHidden="1" w:uiPriority="37" w:unhideWhenUsed="1"/>
              <w:lsdException w:name="TOC Heading" w:semiHidden="1" w:uiPriority="39" w:unhideWhenUsed="1" w:qFormat="1"/>
              <w:lsdException w:name="Plain Table 1" w:uiPriority="41"/>
              <w:lsdException w:name="Plain Table 2" w:uiPriority="42"/>
              <w:lsdException w:name="Plain Table 3" w:uiPriority="43"/>
              <w:lsdException w:name="Plain Table 4" w:uiPriority="44"/>
              <w:lsdException w:name="Plain Table 5" w:uiPriority="45"/>
              <w:lsdException w:name="Grid Table Light" w:uiPriority="40"/>
              <w:lsdException w:name="Grid Table 1 Light" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful" w:uiPriority="52"/>
              <w:lsdException w:name="Grid Table 1 Light Accent 1" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2 Accent 1" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3 Accent 1" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4 Accent 1" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark Accent 1" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful Accent 1" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful Accent 1" w:uiPriority="52"/>
              <w:lsdException w:name="Grid Table 1 Light Accent 2" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2 Accent 2" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3 Accent 2" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4 Accent 2" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark Accent 2" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful Accent 2" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful Accent 2" w:uiPriority="52"/>
              <w:lsdException w:name="Grid Table 1 Light Accent 3" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2 Accent 3" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3 Accent 3" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4 Accent 3" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark Accent 3" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful Accent 3" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful Accent 3" w:uiPriority="52"/>
              <w:lsdException w:name="Grid Table 1 Light Accent 4" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2 Accent 4" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3 Accent 4" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4 Accent 4" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark Accent 4" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful Accent 4" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful Accent 4" w:uiPriority="52"/>
              <w:lsdException w:name="Grid Table 1 Light Accent 5" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2 Accent 5" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3 Accent 5" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4 Accent 5" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark Accent 5" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful Accent 5" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful Accent 5" w:uiPriority="52"/>
              <w:lsdException w:name="Grid Table 1 Light Accent 6" w:uiPriority="46"/>
              <w:lsdException w:name="Grid Table 2 Accent 6" w:uiPriority="47"/>
              <w:lsdException w:name="Grid Table 3 Accent 6" w:uiPriority="48"/>
              <w:lsdException w:name="Grid Table 4 Accent 6" w:uiPriority="49"/>
              <w:lsdException w:name="Grid Table 5 Dark Accent 6" w:uiPriority="50"/>
              <w:lsdException w:name="Grid Table 6 Colorful Accent 6" w:uiPriority="51"/>
              <w:lsdException w:name="Grid Table 7 Colorful Accent 6" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light Accent 1" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2 Accent 1" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3 Accent 1" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4 Accent 1" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark Accent 1" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful Accent 1" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful Accent 1" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light Accent 2" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2 Accent 2" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3 Accent 2" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4 Accent 2" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark Accent 2" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful Accent 2" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful Accent 2" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light Accent 3" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2 Accent 3" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3 Accent 3" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4 Accent 3" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark Accent 3" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful Accent 3" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful Accent 3" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light Accent 4" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2 Accent 4" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3 Accent 4" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4 Accent 4" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark Accent 4" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful Accent 4" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful Accent 4" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light Accent 5" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2 Accent 5" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3 Accent 5" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4 Accent 5" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark Accent 5" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful Accent 5" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful Accent 5" w:uiPriority="52"/>
              <w:lsdException w:name="List Table 1 Light Accent 6" w:uiPriority="46"/>
              <w:lsdException w:name="List Table 2 Accent 6" w:uiPriority="47"/>
              <w:lsdException w:name="List Table 3 Accent 6" w:uiPriority="48"/>
              <w:lsdException w:name="List Table 4 Accent 6" w:uiPriority="49"/>
              <w:lsdException w:name="List Table 5 Dark Accent 6" w:uiPriority="50"/>
              <w:lsdException w:name="List Table 6 Colorful Accent 6" w:uiPriority="51"/>
              <w:lsdException w:name="List Table 7 Colorful Accent 6" w:uiPriority="52"/>
            </w:latentStyles>
            <w:style w:type="paragraph" w:default="1" w:styleId="Normal">
              <w:name w:val="Normal"/>
              <w:qFormat/>
            </w:style>
            <w:style w:type="character" w:default="1" w:styleId="DefaultParagraphFont">
              <w:name w:val="Default Paragraph Font"/>
              <w:uiPriority w:val="1"/>
              <w:semiHidden/>
              <w:unhideWhenUsed/>
            </w:style>
            <w:style w:type="table" w:default="1" w:styleId="TableNormal">
              <w:name w:val="Normal Table"/>
              <w:uiPriority w:val="99"/>
              <w:semiHidden/>
              <w:unhideWhenUsed/>
              <w:tblPr>
                <w:tblInd w:w="0" w:type="dxa"/>
                <w:tblCellMar>
                  <w:top w:w="0" w:type="dxa"/>
                  <w:left w:w="108" w:type="dxa"/>
                  <w:bottom w:w="0" w:type="dxa"/>
                  <w:right w:w="108" w:type="dxa"/>
                </w:tblCellMar>
              </w:tblPr>
            </w:style>
            <w:style w:type="numbering" w:default="1" w:styleId="NoList">
              <w:name w:val="No List"/>
              <w:uiPriority w:val="99"/>
              <w:semiHidden/>
              <w:unhideWhenUsed/>
            </w:style>
            <w:style w:type="paragraph" w:styleId="ListParagraph">
              <w:name w:val="List Paragraph"/>
              <w:basedOn w:val="Normal"/>
              <w:uiPriority w:val="34"/>
              <w:qFormat/>
              <w:pPr>
                <w:ind w:left="720"/>
                <w:contextualSpacing/>
              </w:pPr>
            </w:style>
          </w:styles>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/customXml/_rels/item1.xml.rels" pkg:contentType="application/vnd.openxmlformats-package.relationships+xml" pkg:padding="256">
        <pkg:xmlData>
          <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
            <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/customXmlProps" Target="itemProps1.xml"/>
          </Relationships>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/numbering.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml">
        <pkg:xmlData>
          <w:numbering xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:cx="http://schemas.microsoft.com/office/drawing/2014/chartex" xmlns:cx1="http://schemas.microsoft.com/office/drawing/2015/9/8/chartex" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" mc:Ignorable="w14 w15 w16se wp14">
            <w:abstractNum w:abstractNumId="0" w15:restartNumberingAfterBreak="0">
              <w:nsid w:val="19CE3BDB"/>
              <w:multiLevelType w:val="hybridMultilevel"/>
              <w:tmpl w:val="57280EC4"/>
              <w:lvl w:ilvl="0" w:tplc="DFE2715C">
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val="-"/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="720" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Consolas" w:eastAsia="Times New Roman" w:hAnsi="Consolas" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="1" w:tplc="04090003" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val="o"/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="1440" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="2" w:tplc="04090005" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val=""/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="2160" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Wingdings" w:hAnsi="Wingdings" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="3" w:tplc="04090001" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val=""/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="2880" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="4" w:tplc="04090003" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val="o"/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="3600" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="5" w:tplc="04090005" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val=""/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="4320" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Wingdings" w:hAnsi="Wingdings" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="6" w:tplc="04090001" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val=""/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="5040" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Symbol" w:hAnsi="Symbol" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="7" w:tplc="04090003" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val="o"/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="5760" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:hint="default"/>
                </w:rPr>
              </w:lvl>
              <w:lvl w:ilvl="8" w:tplc="04090005" w:tentative="1">
                <w:start w:val="1"/>
                <w:numFmt w:val="bullet"/>
                <w:lvlText w:val=""/>
                <w:lvlJc w:val="left"/>
                <w:pPr>
                  <w:ind w:left="6480" w:hanging="360"/>
                </w:pPr>
                <w:rPr>
                  <w:rFonts w:ascii="Wingdings" w:hAnsi="Wingdings" w:hint="default"/>
                </w:rPr>
              </w:lvl>
            </w:abstractNum>
            <w:num w:numId="1">
              <w:abstractNumId w:val="0"/>
            </w:num>
          </w:numbering>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/customXml/itemProps1.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.customXmlProperties+xml" pkg:padding="32">
        <pkg:xmlData pkg:originalXmlStandalone="no">
          <ds:datastoreItem ds:itemID="{CFBC8680-73E2-4D03-BFD0-0AE4AA41B464}" xmlns:ds="http://schemas.openxmlformats.org/officeDocument/2006/customXml">
            <ds:schemaRefs>
              <ds:schemaRef ds:uri="http://schemas.openxmlformats.org/officeDocument/2006/bibliography"/>
            </ds:schemaRefs>
          </ds:datastoreItem>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/docProps/core.xml" pkg:contentType="application/vnd.openxmlformats-package.core-properties+xml" pkg:padding="256">
        <pkg:xmlData>
          <cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <dc:title/>
            <dc:subject/>
            <dc:creator>Keith Sadvari</dc:creator>
            <cp:keywords/>
            <dc:description/>
            <cp:lastModifiedBy>Keith Sadvari</cp:lastModifiedBy>
            <cp:revision>2</cp:revision>
            <dcterms:created xsi:type="dcterms:W3CDTF">2015-11-16T02:45:00Z</dcterms:created>
            <dcterms:modified xsi:type="dcterms:W3CDTF">2015-11-16T02:45:00Z</dcterms:modified>
          </cp:coreProperties>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/customXml/item1.xml" pkg:contentType="application/xml" pkg:padding="32">
        <pkg:xmlData pkg:originalXmlStandalone="no">
          <b:Sources xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography" xmlns="http://schemas.openxmlformats.org/officeDocument/2006/bibliography" SelectedStyle="\APASixthEditionOfficeOnline.xsl" StyleName="APA" Version="6"/>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/fontTable.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml">
        <pkg:xmlData>
          <w:fonts xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" mc:Ignorable="w14 w15 w16se">
            <w:font w:name="Consolas">
              <w:panose1 w:val="020B0609020204030204"/>
              <w:charset w:val="00"/>
              <w:family w:val="modern"/>
              <w:pitch w:val="fixed"/>
              <w:sig w:usb0="E00002FF" w:usb1="0000FCFF" w:usb2="00000001" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000"/>
            </w:font>
            <w:font w:name="Times New Roman">
              <w:panose1 w:val="02020603050405020304"/>
              <w:charset w:val="00"/>
              <w:family w:val="roman"/>
              <w:pitch w:val="variable"/>
              <w:sig w:usb0="E0002EFF" w:usb1="C0007843" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000"/>
            </w:font>
            <w:font w:name="Courier New">
              <w:panose1 w:val="02070309020205020404"/>
              <w:charset w:val="00"/>
              <w:family w:val="modern"/>
              <w:pitch w:val="fixed"/>
              <w:sig w:usb0="E0002EFF" w:usb1="C0007843" w:usb2="00000009" w:usb3="00000000" w:csb0="000001FF" w:csb1="00000000"/>
            </w:font>
            <w:font w:name="Wingdings">
              <w:panose1 w:val="05000000000000000000"/>
              <w:charset w:val="02"/>
              <w:family w:val="auto"/>
              <w:pitch w:val="variable"/>
              <w:sig w:usb0="00000000" w:usb1="10000000" w:usb2="00000000" w:usb3="00000000" w:csb0="80000000" w:csb1="00000000"/>
            </w:font>
            <w:font w:name="Symbol">
              <w:panose1 w:val="05050102010706020507"/>
              <w:charset w:val="02"/>
              <w:family w:val="roman"/>
              <w:pitch w:val="variable"/>
              <w:sig w:usb0="00000000" w:usb1="10000000" w:usb2="00000000" w:usb3="00000000" w:csb0="80000000" w:csb1="00000000"/>
            </w:font>
            <w:font w:name="Calibri">
              <w:panose1 w:val="020F0502020204030204"/>
              <w:charset w:val="00"/>
              <w:family w:val="swiss"/>
              <w:pitch w:val="variable"/>
              <w:sig w:usb0="E00002FF" w:usb1="4000ACFF" w:usb2="00000001" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000"/>
            </w:font>
            <w:font w:name="Calibri Light">
              <w:panose1 w:val="020F0302020204030204"/>
              <w:charset w:val="00"/>
              <w:family w:val="swiss"/>
              <w:pitch w:val="variable"/>
              <w:sig w:usb0="A00002EF" w:usb1="4000207B" w:usb2="00000000" w:usb3="00000000" w:csb0="0000019F" w:csb1="00000000"/>
            </w:font>
          </w:fonts>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/word/webSettings.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml">
        <pkg:xmlData>
          <w:webSettings xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" mc:Ignorable="w14 w15 w16se">
            <w:optimizeForBrowser/>
            <w:allowPNG/>
          </w:webSettings>
        </pkg:xmlData>
      </pkg:part>
      <pkg:part pkg:name="/docProps/app.xml" pkg:contentType="application/vnd.openxmlformats-officedocument.extended-properties+xml" pkg:padding="256">
        <pkg:xmlData>
          <Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
            <Template>Normal.dotm</Template>
            <TotalTime>0</TotalTime>
            <Pages>2</Pages>
            <Words>506</Words>
            <Characters>2887</Characters>
            <Application>Microsoft Office Word</Application>
            <DocSecurity>0</DocSecurity>
            <Lines>24</Lines>
            <Paragraphs>6</Paragraphs>
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
            <CharactersWithSpaces>3387</CharactersWithSpaces>
            <SharedDoc>false</SharedDoc>
            <HyperlinksChanged>false</HyperlinksChanged>
            <AppVersion>16.0000</AppVersion>
          </Properties>
        </pkg:xmlData>
      </pkg:part>
    </pkg:package>
  </xsl:template>
</xsl:stylesheet>