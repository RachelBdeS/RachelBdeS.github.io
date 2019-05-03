<?xml version="1.0" encoding="ISO-8859-1" ?>
<!--
 	Version 2.0.4 du 23/05/2004
 		- Lecture des mots-clefs à partir du fichier cours.xml.
 -->
<!--
	Version 2.0.3 du 06/04/2004
		- Ajout d'attributs tabindex.
-->
<!--
	Version 2.0.2 du 05/03/2004
		- Ajout de l'attribut title aux grands titres de chapitres, renvoyant aux descriptions des modules dans le fichier XML.
		- Suppression de l'attribut xml:lang de l'élément html racine.
-->
<!--
	Version 2.0.1 du 27/02/2004
		- Appel à des templates pour l'affichage des paragraphes et des exercices.
		- Corrections de style (appel aux feuilles de style, classes dans les titres...).
-->

<!--
	Version 2.0.0 du 05/10/2003
		- Récupération de la table des matières de chaque chapitre automatiquement.
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
			<link rel="stylesheet" type="text/css" href="cours.css"/>
			<link rel="stylesheet" type="text/css" href="coursscreen.css" media="screen"/>
			<style type="text/css">
				h4.tablematieres{
				display: block;
				position: relative;
				top: 0%;
				left: 10px;
				background-color: transparent;
				}
				
				h5.tablematieres{
				display: block;
				position: relative;
				top: 0%;
				left: 20px;
				background-color: transparent;
				}
				
				h6.tablematieres{
				display: block;
				position: relative;
				top: 0%;
				left: 30px;
				background-color: transparent;
				}
			</style>
		</head>
		<body>
			<table width="100%" summary="lien XML" class="lienxml">
				<tr>
					<td><h1><xsl:value-of select="//titre"/></h1></td>
					<td class="lienxml"><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="//@nomfichier"/>.xml</xsl:attribute><span class="lienxml">Version XML</span></xsl:element></td>
				</tr>
			</table>
			<div class="entete">
				<table width="100%" summary="entête">
					<tr class="titreentete">
						<th>Auteur</th>
						<th>Adresse</th>
					</tr>
					<tr>
						<td>
							<xsl:value-of select="//identite"/><br/>
							Courriel:
							<script type="text/javaScript">eval("))))\".\",g/$\\/(ecalper.))1(rtsbus.\"G\",g/-/(ecalper.'rf$uei-ssuj$6p--mda0400u\\nongahC$-selliG:otliam'((knil.))\"@\",g/+\\/(ecalper.)\".\",g/#\\/(ecalper.))1(rtsbus.\"Z\",g/N/(ecalper.'NnoNngahNC #G'((etirw.tnemucod".split("").reverse().join("")) // unjk@kuus.com </script>
							<xsl:if test="//telephone/@tel"><br />Téléphone: <xsl:value-of select="//telephone/@tel"/></xsl:if>
							<xsl:if test="//telephone/@fax"><br />Fax: <xsl:value-of select="//telephone/@fax"/></xsl:if>
						</td>
						<td>
							<xsl:value-of select="//organisme"/><br />
							<xsl:value-of select="//localisation"/><br />
							<xsl:value-of select="//rue"/><br />
							<xsl:value-of select="//ville"/><br />
							<xsl:value-of select="//pays"/>
						</td>
					</tr>
				</table>
			</div>
			<div class="tablematieres">
				<h2 class="tablematieres">Table des matières par têtes de chapitre</h2>
				<xsl:for-each select="/cours/plan/chapitre">
					<h3 class="tablematieres"><xsl:number from="/" level="single" format="A." lang="fr"/> 
							<xsl:element name="a"><xsl:attribute name="href">#<xsl:value-of select="@href"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/resume"/></xsl:attribute><xsl:attribute name="tabindex"><xsl:number from="/" level="single" format="1" value="position()"/></xsl:attribute><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/titre"/></xsl:element>
					</h3>
				</xsl:for-each>
			</div>
			<hr/>
			<div class="tablematieres">
				<h2 class="tablematieres">Table des matières</h2>
				<xsl:for-each select="/cours/plan/chapitre">
					<xsl:variable name="fichier" select="concat(@href,'.html')"/>
					<a name="{@href}"></a><h3 class="tablematieres"><xsl:number from="/" level="single" format="A." lang="fr"/> 
							<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="@href"/>.html</xsl:attribute><xsl:attribute name="tabindex"><xsl:number from="/" level="single" format="1" value="position()+count(//chapitre)"/></xsl:attribute><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/titre"/></xsl:element>
					</h3>
					<xsl:for-each select="document(concat(@href,'.xml'))/chapitre/corpus/partie">
						<h4 class="tablematieres"><xsl:number from="/" level="single" format="I."/>
								<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element>
						</h4>
						<xsl:for-each select="section">
							<h5 class="tablematieres"><xsl:number from="/" level="single" format="1."/>
								<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element>
							</h5>
								<xsl:for-each select="paragraphe">
									<xsl:call-template name="paragraphe">
										<xsl:with-param name="fichier" select="$fichier"/>
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="exercice">
									<xsl:call-template name="exercice">
										<xsl:with-param name="fichier" select="$fichier"/>
									</xsl:call-template>
								</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="paragraphe">
							<xsl:call-template name="paragraphe">
								<xsl:with-param name="fichier" select="$fichier"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="exercice">
							<xsl:call-template name="exercice">
								<xsl:with-param name="fichier" select="$fichier"/>
							</xsl:call-template>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
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
	<xsl:if test="@titre"><h6 class="tablematieres"><xsl:number from="/" level="single" format="a."/><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h6></xsl:if>
</xsl:template>

<xsl:template name="exercice">
	<xsl:param name="fichier"/>
	<h6 class="tablematieres">Exercice&#160;<xsl:number from="/" level="single" format="1."/>&#160;<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h6>
</xsl:template>

</xsl:stylesheet>
