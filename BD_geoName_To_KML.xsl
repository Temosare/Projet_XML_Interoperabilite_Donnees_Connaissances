<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:p="urn:ns:TeiSpe"
    xmlns:sch="urn:ns:sch" xmlns:T="urn:ns:Tei"
    xmlns="http://earth.google.com/kml/2.0"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="@* | node()">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="sch:document">
        <kml version="1.1"
            creator="Guillaume Bolzonella"
            xmlns="http://earth.google.com/kml/2.0">
            
            <metadata>
                <name>Transformation en fichier KML pour viasualisation avec Google earth</name>
                <desc>Livrable 4 partie 4</desc>
            </metadata>
            
            <xsl:for-each select="geoname">           
                <Placemark>
                    <name><xsl:value-of select="name"/></name>
                    <!-- ici description sera identique à "name" je l'est placé comme cela pour respecter l'ossature des fichiers KML utilisé avec google earth -->
                    <description><xsl:value-of select="name"/></description>
                    <Point>
                        <coordinates><xsl:value-of select="lng"/>,<xsl:value-of select="lat"/></coordinates>
                    </Point>
                </Placemark>
            </xsl:for-each>
            
            <Document>
                <xsl:apply-templates/> 
            </Document>
            
        </kml>
    </xsl:template>
    
    <xsl:template match="geoname">
        <Placemark>
            <name><xsl:value-of select="name"/></name>
            <description><xsl:value-of select="name"/></description>
            <Point>
                <coordinates><xsl:value-of select="lng"/>,<xsl:value-of select="lat"/></coordinates>
            </Point>
        </Placemark>
    </xsl:template>
    
</xsl:stylesheet>