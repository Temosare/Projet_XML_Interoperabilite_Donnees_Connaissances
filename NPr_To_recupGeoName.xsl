<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" indent="yes"/>
 
 <xsl:template match="ListNPr">
  <sch:document xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns="urn:ns:TeiSpe"
   xmlns:sch="urn:ns:sch"
   xmlns:T="urn:ns:Tei"
   xmlns:p="urn:ns:TeiSpe">
   <T:TEI>
    <T:teiHeader>
     <T:fileDesc>
      <T:titleStmt>
       <T:title> Recuperation des information avec geoName : Livrable 4 partie 3 </T:title>
      </T:titleStmt>
      <T:publicationStmt>
       <T:p> Fichier produit par Guillaume Bolzonella </T:p>
      </T:publicationStmt>
     </T:fileDesc>
    </T:teiHeader>
    <T:text>
     <T:body>
      <T:p>
       <corpText>
        <xsl:for-each select="NPr">
         <!-- La ligne suivante permet de recuperer le contenu d'une (requete) sur le site geoName -->
         
         <xsl:copy-of select="document(concat('http://api.geonames.org/search?name_equals=',current(),'&amp;continentCode=EU&amp;country=fr&amp;lang=fr&amp;style=short&amp;username=temosare'))"/>
         
         <!--http://api.geonames.org/search?name_equals=Bellevue&country=FR&lang=fr&username=temosare&style=short-->
         <!-- &amp => permet de lancer la requette en remplaçant & dont a besoin initialement le serveur ou l'on fait le requette  -->
         <!-- name_equals => permet de récupérer dans la base de donnée les corespondance exacte de current() (le problème est qu'il vas récuperer tous ou il y a une occurence de current(), il faudrai de la désambiguisé)  -->
         <!-- continentCode => permet d'indiquer le continant sur lequel nous voulons les résultats -->
         <!-- country => indique le pays pour affiner la recherche -->
         <!-- lang => indique simplement en quelle langue nous voulons le resultat -->
         <!-- style => indique le nombre d'information que nous voulons récupérer lors de la recherche (short/medium/full) -->
         <!-- username => indique un nom de compte affin de pouvoir effectuer les requettes, obligatoire car le mode démo ne permet pas toutes les recherche, celui est limité en nombre de requettes par jours 20k credit -->
        </xsl:for-each>
       </corpText> 
      </T:p>
     </T:body>
    </T:text>
   </T:TEI>
  </sch:document>         
 </xsl:template>
 
</xsl:stylesheet>





