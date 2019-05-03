<?xml version="1.0" encoding="UTF-8"?>
<!-- Version 1.01 du 05/11/2005
	- Mise en commun des ressources des cours.
-->
<!-- Version 1.0 du 25/10/2005
	- Création.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	
	<xsl:import href="../ressources/general11.xsl"/>
	
	<xsl:output method="html" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:template match="/">
		
		<html lang="fr">
			<head>
				<title>Table des matières détaillées du cours</title>
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
				<xsl:call-template name="gen_entete"><xsl:with-param name="destination" select="$destination"/><xsl:with-param name="titre" select="'Table des matières'"/></xsl:call-template>
				
				<xsl:call-template name="menu"/>
				<xsl:call-template name="intro"/>
				
				<xsl:call-template name="tablemat"/>
				<xsl:call-template name="tablematlongue"/>
				
				<xsl:call-template name="gen_licence"/>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="menu">
		<ul id="menu">
			<li class="page"><a href="#avantpropos">Introduction</a></li>
			<li class="page"><a href="#tablemat" accesskey="s">Table des matières succincte</a></li>
			<li class="page"><a href="#tablemat2" accesskey="s">Table des matières détaillée</a></li>
			<li class="cours"><a href="historique.html">Historique</a></li>
			<li class="cours"><a href="exercices.html">Exercices</a></li>
			<li class="cours"><span class="actif">Table des matières</span></li>
			<li class="cours"><a href="index.html">Accueil du cours</a></li>
		</ul>
	</xsl:template>
	
	<xsl:template name="intro">
		<div id="avantpropos">
			<h2>Introduction</h2>
			<p>Vous trouverez la table des matières après la liste des têtes de chapitres vous permettant un accès plus rapide.</p>
			<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template name="tablemat">
		<div id="tablemat">
		<h2>Contenu de ces pages</h2>
		<xsl:for-each select="//plan"><xsl:apply-templates/></xsl:for-each>
			<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template name="tablematlongue">
		<div id="tablemat2">
			<h2>Table des matières détaillée</h2>
			<xsl:for-each select="//thème">
				<h3 id="t{count(preceding::thème)}"><xsl:number from="/" level="single" format="A. "/><xsl:value-of select="@titre"/></h3>
				<ol>
					<xsl:for-each select="chapitre">
						<xsl:variable name="ficxml" select="concat(@href, '.xml')"/>
						<xsl:variable name="fichtml" select="concat(@href, '.html')"/>
						<li id="chap{$ficxml}"><a href="{$fichtml}"><xsl:value-of select="document(concat('../',$location,'/',$ficxml))/chapitre/entete/titre"/></a>
						<ol>
							<xsl:for-each select="document(concat('../',$location,'/',$ficxml))/chapitre/corpus/partie">
								<li><a href="{concat($fichtml,'#',@ancre)}"><xsl:value-of select="@titre"/></a>
									<xsl:if test="section"><ol>
										<xsl:for-each select="section">
											<li><a href="{concat($fichtml,'#',@ancre)}"><xsl:value-of select="@titre"/></a></li>
										</xsl:for-each>
									</ol></xsl:if>
									<p class="retourhaut"><a href="#t{count(preceding::thème)}">Retour au thème</a></p>
								</li>
							</xsl:for-each>
						</ol>
						</li>
					</xsl:for-each>
				</ol>
				<p class="retourhaut"><a href="#tablemat">Retour à la table des matières succincte</a></p>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template match="thème">
		<xsl:variable name="aPositionImpaire" select="count(preceding::thème) mod 2=0"/>
		<xsl:choose>
			<xsl:when test="$aPositionImpaire"><div class="impair"><h3><a href="#t{count(preceding::thème)}"><xsl:value-of select="@titre"/></a></h3><xsl:apply-templates/><!--<h4>Exercices sur les cours de déclarations</h4><h4>Ce qu'il faut retenir de ce chapitre</h4>--></div></xsl:when>
			<xsl:otherwise><div class="pair"><h3><a href="#t{count(preceding::thème)}"><xsl:value-of select="@titre"/></a></h3><xsl:apply-templates/><!--<h4>Exercices sur les cours de déclarations</h4><h4>Ce qu'il faut retenir de ce chapitre</h4>--></div></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="intro">
		<p class="intro"><xsl:apply-templates/></p>
	</xsl:template>
	
	<xsl:template match="chapitre">
		<h4><a href="#chap{concat(@href, '.xml')}"><xsl:value-of select="document(concat('../',$location,'/',concat(@href,'.xml')))/chapitre/entete/titre"/></a></h4>
		<p><xsl:value-of select="document(concat('../',$location,'/',concat(@href,'.xml')))/chapitre/entete/resume"/></p>
	</xsl:template>
	
</xsl:stylesheet>
