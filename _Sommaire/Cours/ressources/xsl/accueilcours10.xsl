<?xml version="1.0" encoding="ISO-8859-1" ?>
<!--
	Version 1.0 du 06/10/2004	
		- Cr�ation.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
<!--<xsl:output method="xml" version="xhtml 1.0" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>-->

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
			<link rel="stylesheet" type="text/css" href="forme1cours.css"/>
		</head>
		<body>
			<div id="entete">
				<h1><xsl:value-of select="//titre"/></h1>
				<p>Derni�re <a href="#listemaj">mise � jour</a> le <xsl:value-of select="//maj[1]/quand"/>.</p>
			</div>
			<div id="tablematcourte">
				<h3>Table des mati�res par t�tes de chapitre</h3>
				<ol>
				<xsl:for-each select="/cours/plan/chapitre">
					<li><h4><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat(@href, '.html')"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/resume"/></xsl:attribute><xsl:attribute name="tabindex"><xsl:number from="/" level="single" format="1" value="position()"/></xsl:attribute><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/titre"/></xsl:element>
					</h4></li>
				</xsl:for-each>
				    <li><h4><a href="license.html">GNU Free Documentation License</a></h4></li>
				</ol>
				<hr />
				<p><a href="exercices.html">Exercices</a></p>
				<hr />
				<p>Auteur: <a href="mailto:Gilles.Chagnon@free.fr"><xsl:value-of select="//auteur/identite"/></a></p>
				<hr />
				<p><a href="../index.html">Tous les cours</a></p>
				<hr/>
				<!--DEBUT GOLD WEBORAMA-->
					<script type="text/javascript">
						//<![CDATA[
							WEBO_ZONE=]]><xsl:value-of select="document('weborama.xml')/zone/@numero"/><![CDATA[; 
							WEBO_PAGE=]]><xsl:value-of select="document('weborama.xml')/zone/@accueil"/><![CDATA[; 
							webogold_ok=0;
						//]]>
					</script>
					<script src="http://script.weborama.fr/gold.js" type="text/javascript"></script>
					<script type="text/javascript">
						//<![CDATA[
							if(webogold_ok==1){webogold_zpi(WEBO_ZONE,WEBO_PAGE,2917);}
						//]]>
					</script> <!--FIN GOLD WEBORAMA-->
			</div>
			<div id="main">
			    <div id="corpus">
			        <h1><xsl:value-of select="//titre"/></h1>
			        <p><xsl:value-of select="//description"/></p>
			        <p>Une <a href="toc.html">table des mati�res d�taill�e</a> est �galement disponible.</p>
			        <p>Copyright (c) 2004 Gilles Chagnon<br/>
Permission vous est donn�e de copier, distribuer et/ou modifier ce document selon les termes de la licence GNU Free Documentation License, version 1.1 ou ult�rieure publi�e par la Free Software Foundation ; pas de section inalt�rable ; pas de texte de premi�re page de couverture ; pas de texte de derni�re page de couverture.<br/>
Une copie de cette licence est incluse dans la section appel�e <a href="license.html">GNU Free Documentation License</a> de ce document.<br/>
Pour votre information, vous pouvez consulter une <a href="http://fsffrance.org/gpl/gpl-fr.fr.html">version fran�aise</a> de cette licence, non normative (en cas de litige, seule la version anglaise fait foi).
			        </p>
			    </div>
				<div id="maj">
					<a name="listemaj"></a><h4>Historique de ce document</h4>
					<dl>
					<xsl:for-each select="//maj">
						<dt>Le <xsl:value-of select="quand"/>, par <xsl:value-of select="qui"/> (v. <xsl:value-of select="@version"/>):</dt>
						<dd><xsl:value-of select="quoi"/></dd>
					</xsl:for-each>
					</dl>
				</div>
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template name="general">
	<xsl:param name="fichier"/>
	<xsl:value-of select="."/><br/>
	<xsl:choose>
		<xsl:when test=".=section">section
			<xsl:call-template name="section">
				<xsl:with-param name="fichier" select="$fichier"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test=".='paragraphe'">par
			<xsl:call-template name="paragraphe">
				<xsl:with-param name="fichier" select="$fichier"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test=".='exercice'">exo
			<xsl:call-template name="exercice">
				<xsl:with-param name="fichier" select="$fichier"/>
			</xsl:call-template>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="section">
	<xsl:param name="fichier"/>
	<h5><xsl:number from="/" level="single" format="1."/><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h5>
</xsl:template>

<xsl:template name="paragraphe">
	<xsl:param name="fichier"/>
	<xsl:if test="@titre"><h6><xsl:number from="/" level="single" format="a."/><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h6></xsl:if>
</xsl:template>

<xsl:template name="exercice">
	<xsl:param name="fichier"/>
	<h6>Exercice&#160;<xsl:number from="/" level="single" format="1."/>&#160;<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h6>
</xsl:template>

</xsl:stylesheet>
