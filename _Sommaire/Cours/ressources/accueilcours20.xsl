<?xml version="1.0" encoding="UTF-8"?>
<!-- Version 2.04 du 22/04/2009
	- Suppression du template Weborama
-->
<!-- Version 2.03 du 28/09/2007
	- Automatisation du calcul de l'année (fonction exslt date:year()). Ajout de la bibliographie.
-->
<!-- Version 2.02 du 17/11/2005
	- Ajout de la prise en compte des liens dans la partie introductive.
-->
<!-- Version 2.01 du 05/11/2005
	- Mise en commun des ressources des cours.
-->
<!-- Version 2.0 du 10/10/2005
	- Création.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:import href="../ressources/general11.xsl"/>
	
	<xsl:output method="html" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:template match="/">
	
	<html lang="fr">
		<head>
			<title><xsl:value-of select="cours/titre"/></title>
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
				<xsl:attribute name="content"><xsl:value-of select="/cours/resume"/></xsl:attribute>
			</xsl:element>
			<xsl:call-template name="gen_AppelFeuillesDeStyle"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
		</head>
		<body>
		<xsl:call-template name="gen_menugeneral"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
		<xsl:call-template name="gen_entete"><xsl:with-param name="destination" select="$destination"/><xsl:with-param name="titre" select="'non'"/></xsl:call-template>
		
		<xsl:call-template name="menu"/>
		<xsl:call-template name="intro"/>
		<xsl:call-template name="tablemat"/>
		<xsl:if test="document(concat('../',$location,'/','cours.xml'))//bibliographie"><xsl:call-template name="biblio"/></xsl:if>
		<xsl:call-template name="gen_licence"/>
		</body>
	</html>
	</xsl:template>
	
	<xsl:template name="menu">
		<ul id="menu">
			<li class="page"><a href="#avantpropos" tabindex="6">Introduction</a></li>
			<li class="page"><a href="#tablemat" accesskey="s" tabindex="7">Contenu de ces cours</a></li>
			<li class="cours"><a href="historique.html" title="Historique de ce document" tabindex="10">Historique</a></li>
			<li class="cours"><a href="exercices.html" tabindex="9">Exercices</a></li>
			<li class="cours"><a href="toc.html" tabindex="8">Table des matières</a></li>
			<li class="cours"><span class="actif">Accueil du cours</span></li>
		</ul>		
	</xsl:template>
	
	<xsl:template name="intro">
		<div id="avantpropos">
		<h2>Introduction</h2>
		<p><xsl:apply-templates select="/cours/description"/></p>
		<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template name="tablemat">
		<div id="tablemat">
			<h2>Contenu de ces pages</h2>
			<xsl:for-each select="//plan"><xsl:apply-templates/></xsl:for-each>
			<xsl:call-template name="licence"/>
			<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template match="thème">
		<xsl:variable name="aPositionImpaire" select="count(preceding::thème) mod 2=0"/>
		<xsl:choose>
			<xsl:when test="$aPositionImpaire"><div class="impair"><h3><xsl:value-of select="@titre"/></h3><xsl:apply-templates/></div></xsl:when>
			<xsl:otherwise><div class="pair"><h3><xsl:value-of select="@titre"/></h3><xsl:apply-templates/></div></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="intro">
		<p class="intro"><xsl:apply-templates/></p>
	</xsl:template>
	
	<xsl:template match="acronyme">
		<acronym title="{@titre}"> <xsl:value-of select="." /> </acronym>
	</xsl:template>
	
	<xsl:template match="chapitre">
		<h4><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat(@href, '.html')"/></xsl:attribute><xsl:value-of select="document(concat('../',$location,'/',concat(@href,'.xml')))/chapitre/entete/titre"/></xsl:element></h4>
		<p><xsl:value-of select="document(concat('../',$location,'/',concat(@href,'.xml')))/chapitre/entete/resume"/></p>
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
	
	<xsl:template name="licence">
		<xsl:choose>
			<xsl:when test="count(//thème) mod 2 =0"><div class="impair"><h3>Conditions d'utilisation&#160;: <a href="http://creativecommons.org/licenses/by-sa/3.0/">CC-by-sa</a></h3></div></xsl:when>
			<xsl:otherwise><div class="pair"><h3>Conditions d'utilisation&#160;: <a href="http://creativecommons.org/licenses/by-sa/3.0/">CC-by-sa</a></h3></div></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="description">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="lien">
		<a href="{@href}"><xsl:value-of select="."/></a>
	</xsl:template>
	
</xsl:stylesheet>
