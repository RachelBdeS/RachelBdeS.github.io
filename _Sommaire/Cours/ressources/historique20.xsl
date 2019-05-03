<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Version 1.03 du 15/03/2010
	- Ajout de scope="col" dans les cellules d'entête du tableau
-->
<!-- Version 1.02 du 17/09/2006
	- Ajout de liens dans les résumés de modifications.
-->
<!-- Version 1.01 du 05/11/2005
	- Mise en commun des ressources des cours.
-->
<!-- Version 1.0 du 21/10/2005
	- Création
-->
	<xsl:import href="../ressources/general11.xsl"/>
	
	<xsl:output method="html" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:template match="/">
		
		<html lang="fr">
			<head>
				<title>Historique du cours</title>
				<xsl:element name="meta">
					<xsl:attribute name="name">author</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//identite"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">keywords</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//motsclefs"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">description</xsl:attribute>
					<xsl:attribute name="content">Historique détaillé du <xsl:value-of select="cours/titre"/>.</xsl:attribute>
				</xsl:element>
				<xsl:call-template name="gen_AppelFeuillesDeStyle"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
			</head>
		
			<body>
			<xsl:call-template name="gen_menugeneral"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
			<xsl:call-template name="gen_entete"><xsl:with-param name="destination" select="$destination"/><xsl:with-param name="titre" select="'Historique'"/></xsl:call-template>
			
			<xsl:call-template name="menu"/>
			<xsl:call-template name="historique"/>
			<xsl:call-template name="gen_licence"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="menu">
		<ul id="menu">
			<li class="cours"><span class="actif">Historique</span></li>
			<li class="cours"><a href="exercices.html" tabindex="7">Exercices</a></li>
			<li class="cours"><a href="toc.html" tabindex="8">Table des matières</a></li>
			<li class="cours"><a href="index.html" tabindex="9">Accueil du cours</a></li>
		</ul>
	</xsl:template>
	
	<xsl:template name="historique">
		<table summary="Historique détaillé des mises à jour du cours" border="1">
			<tr><th scope="col">Version</th><th scope="col">Date</th><th scope="col">Mises à jour</th></tr>
			<xsl:for-each select="document(concat('../',$location,'/','historique.xml'))/misesAJour/quand">
				<tr>
					<td><xsl:call-template name="gen_determineVersion"><xsl:with-param name="fichier" select="'cours'"/><xsl:with-param name="date" select="@date"/></xsl:call-template></td>
					<td><xsl:call-template name="cal_dateSchemaVersDateCalendrier"><xsl:with-param name="date" select="@date"/></xsl:call-template></td>
					<td><ul>
						<xsl:for-each select="maj"><li><xsl:choose>
							<xsl:when test="@où='cours'"><a href="index.html">Tout le cours</a>&#160;: <xsl:apply-templates /></xsl:when>
							<xsl:otherwise><a href="{concat(@où,'.html')}"><xsl:value-of select="document(concat('../',$location,'/',concat(@où,'.xml')))/chapitre/entete/titre"/></a>&#160;: <xsl:apply-templates /></xsl:otherwise>
						</xsl:choose></li>
							</xsl:for-each>
					</ul></td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
	<xsl:template match="lien">
		<a href="{@href}"><xsl:value-of select="."/></a>
	</xsl:template>
	
</xsl:stylesheet>
