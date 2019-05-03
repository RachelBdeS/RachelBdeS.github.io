<?xml version="1.0" encoding="UTF-8"?>
<!-- Version 1.03 du 28/09/2007
	- Automatisation du calcul de l'année (fonction exslt date:year()). Ajout de la bibliographie.
-->
<!-- Version 1.02 du 05/05/2006
	- Teste si présence des corrections pour l'affichage de leur suite.
-->
<!-- Version 1.01 du 04/01/2006
	- Suppression des liens vers les têtes de chapitre (non pertinents).
-->
<!-- Version 1.0 du 02/12/2005
	- Création.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	
	<xsl:import href="../ressources/general11.xsl"/>
	
	<xsl:output method="html" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:template match="/">
		
		<html lang="fr">
			<head>
				<title>Exercices du <xsl:value-of select="cours/titre"/></title>
				<xsl:element name="meta">
					<xsl:attribute name="name">author</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//identite"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">keywords</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//motsclefs"/></xsl:attribute>
				</xsl:element>
				<xsl:call-template name="gen_AppelFeuillesDeStyle"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
			</head>
			
			<body>
				<xsl:call-template name="gen_menugeneral"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
				<xsl:call-template name="gen_entete"><xsl:with-param name="destination" select="$destination"/><xsl:with-param name="titre" select="'Exercices'"/></xsl:call-template>
				<xsl:call-template name="menu"/>
				<xsl:call-template name="exercices"/>
				<xsl:if test="document(concat('../',$location,'/','cours.xml'))//bibliographie"><xsl:call-template name="biblio"/></xsl:if>
				<xsl:call-template name="gen_licence"/>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="menu">
			<ul id="menu">
				<li class="cours"><a href="historique.html">Historique</a></li>
				<li class="cours"><span class="actif">Exercices</span></li>
				<li class="cours"><a href="toc.html" tabindex="8">Table des matières détaillée</a></li>
				<li class="cours"><a href="index.html" tabindex="9">Accueil du cours</a></li>
			</ul>
	</xsl:template>
	
	<xsl:template name="exercices">
		<div id="tablemat">
			<h2>Liste des exercices par chapitre</h2>
			<xsl:for-each select="//plan"><xsl:apply-templates/></xsl:for-each>
			<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template match="thème">
		<xsl:variable name="aPositionImpaire" select="count(preceding::thème) mod 2=0"/>
		<xsl:choose>
			<xsl:when test="$aPositionImpaire"><div class="impair"><h3><a href="#t{count(preceding::thème)}"><xsl:value-of select="@titre"/></a></h3><xsl:apply-templates/></div></xsl:when>
			<xsl:otherwise><div class="pair"><h3><a href="#t{count(preceding::thème)}"><xsl:value-of select="@titre"/></a></h3><xsl:apply-templates/></div></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="chapitre">
		<h4><xsl:value-of select="document(concat('../',$location,'/',concat(@href,'.xml')))/chapitre/entete/titre"/></h4>
		<xsl:if test="document(concat('../',$location,'/',concat(@href,'.xml')))//exercice"><ul>
			<xsl:for-each select="document(concat('../',$location,'/',concat(@href,'.xml')))//exercice"><li><a href="{enonce/@href}"><xsl:value-of select="@titre"/></a><xsl:if test="correction"><ul><xsl:for-each select="correction"><xsl:choose><xsl:when test="@description"><li>Correction&#160;: <a href="{@href}"><xsl:value-of select="@description"/></a></li></xsl:when><xsl:otherwise><li><a href="{@href}">Correction</a></li></xsl:otherwise></xsl:choose></xsl:for-each></ul></xsl:if></li></xsl:for-each>
		</ul></xsl:if>
	</xsl:template>
	
	<xsl:template name="biblio">
		<div id="bibliographie">
			<h2>Bibliographie</h2>
			<xsl:if test="document(concat('../',$location,'/','cours.xml'))//mesLivres"><xsl:call-template name="mesLivres"/></xsl:if>
			<xsl:if test="document(concat('../',$location,'/','cours.xml'))//autresLivres"><xsl:call-template name="autresLivres"/></xsl:if>
		</div>
	</xsl:template>
	
	<xsl:template name="mesLivres">
		<h3>De l'auteur (G. Chagnon)</h3>
		<ul>
			<xsl:for-each select="document(concat('../',$location,'/','cours.xml'))//mesLivres">
				<li><cite><xsl:value-of select="@titre"/></cite>, publié par <xsl:value-of select="@editeur"/> en <xsl:value-of select="@date"/>.<xsl:if test="commentaire">&#160;<xsl:value-of select="commentaire"/>.</xsl:if><xsl:if test="@lienEyrolles">&#160;<a href="{@lienEyrolles}" title="Consulter la fiche sur Eyrolles: {@titre}, publié par {@editeur}">Consulter la fiche sur Eyrolles</a>.</xsl:if><xsl:if test="@lienAmazon">&#160;<a href="{@lienAmazon}" title="Consulter la fiche sur Amazon: {@titre}, publié par {@editeur}">Consulter la fiche sur Amazon</a>.</xsl:if></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template name="autresLivres">
		<h3>D'autres auteurs</h3>
		<ul>
			<xsl:for-each select="document(concat('../',$location,'/','cours.xml'))//autresLivres">
				<li><cite><xsl:value-of select="@titre"/></cite> (<xsl:for-each select="auteurLivre"><xsl:value-of select="auteurLivre"/></xsl:for-each>), publié par <xsl:value-of select="@editeur"/> en <xsl:value-of select="@date"/>.<xsl:if test="commentaire">&#160;<xsl:value-of select="commentaire"/>.</xsl:if><xsl:if test="@lienEyrolles">&#160;<a href="{@lienEyrolles}" title="Consulter la fiche sur Eyrolles: {@titre}, publié par {@editeur}">Consulter la fiche sur Eyrolles</a>.</xsl:if><xsl:if test="@lienAmazon">&#160;<a href="{@lienAmazon}" title="Consulter la fiche sur Amazon: {@titre}, publié par {@editeur}"><xsl:value-of select="@titre"/>Consulter la fiche sur Amazon</a>.</xsl:if></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template match="intro">
		<p class="intro"><xsl:apply-templates/></p>
	</xsl:template>
	
	
</xsl:stylesheet>
