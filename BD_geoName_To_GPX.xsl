<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:p="urn:ns:TeiSpe"
    xmlns:sch="urn:ns:sch" xmlns:T="urn:ns:Tei"
    xmlns="http://www.topografix.com/GPX/1/1"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="@* | node()">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="sch:document">
        <gpx version="1.1"
            creator="Guillaume Bolzonella"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd"
            >
            <metadata>
                <name>Transformation en fichier GPX pour viasualisation avec Google Map</name>
                <desc>Livrable 4 partie 4</desc>
            </metadata>
            
            <xsl:for-each select="//geoname">
                    <wpt lat="{lat}" lon="{lng}">
                        <desc>
                            <xsl:value-of select="name"/>
                        </desc>
                </wpt>
            </xsl:for-each>

            <trk>
                <trkseg>
                    <xsl:apply-templates/>
                </trkseg>  
            </trk>
            
        </gpx>
    </xsl:template>
    
    <xsl:template match="geoname">
        <trkpt lat="{lat}" lon="{lng}">
            <name><xsl:value-of select="name"/></name> 
        </trkpt>    
    </xsl:template>
    
</xsl:stylesheet>