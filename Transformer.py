#!/bin/python


import libxml2
import libxslt


styledoc = libxml2.parseFile("XMLFile/charsheet.xsl")
style = libxslt.parseStylesheetDoc(styledoc)
doc = libxml2.parseFile("XMLFile/Characters.xml")
result = style.applyStylesheet(doc, None)
style.saveResultToFilename("Output/Test.doc", result, 0)
style.freeStylesheet()
doc.freeDoc()
result.freeDoc()
