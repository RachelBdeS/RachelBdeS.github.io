<?xml version="1.0" encoding="ISO-8859-1" ?>
<!-- Version 1.01 du 11/03/2005
 		- Ajout des liens
 -->
<!-- Version 1.0 du 06/02/2005
		- Création.
-->

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
<!--<xsl:output method="xml" version="xhtml 1.0" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>-->

	<xsl:template match="/">
    <!--valeurs possibles: siteweb pour le site sur Free; coursenligne pour le... cours en ligne à l'UPMC -->
                        <xsl:variable name="destination" select="'siteweb'"/>
	<html lang="fr">
		<head>
			<title>Historique du <xsl:value-of select="//titre"/></title>
			<xsl:element name="meta">
				<xsl:attribute name="name">author</xsl:attribute>
				<xsl:attribute name="content"><xsl:value-of select="//identite"/></xsl:attribute>
			</xsl:element>
			<xsl:element name="meta">
				<xsl:attribute name="name">keywords</xsl:attribute>
				<xsl:attribute name="content">historique,<xsl:value-of select="//motsclefs"/></xsl:attribute>
			</xsl:element>
			<xsl:element name="meta">
				<xsl:attribute name="name">description</xsl:attribute>
				<xsl:attribute name="content"><xsl:value-of select="/cours/resume"/></xsl:attribute>
			</xsl:element>
			<xsl:choose>
			    <xsl:when test="$destination='siteweb'">
			        <xsl:variable name="feuille" select="'forme1'"/>
			    </xsl:when>  
			    <xsl:when test="$destination='coursenligne'">
			        <xsl:variable name="feuille" select="'forme2'"/>
			    </xsl:when>  
			    <xsl:otherwise>
			        <xsl:variable name="feuille" select="'forme1'"/>
			    </xsl:otherwise>
			</xsl:choose>
			<style type="text/css">
				body {font-family: Verdana, Arial, sans-serif;}
				dt {padding-top: 1em}
			</style>
		</head>
		<body>
			<h1>Historique</h1>
				<dl>
				<xsl:for-each select="//maj">
					<dt>Le <xsl:value-of select="quand"/>, par <xsl:value-of select="qui"/> (v. <b><xsl:value-of select="@version"/></b>):</dt>
					<dd>
						<ul>
						<xsl:for-each select="quoi">
							<li><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></li>
						</xsl:for-each>
						</ul>
					</dd>
				</xsl:for-each>
				</dl>
			<hr/>
			<p><a href="index.html">Retour au cours</a>.</p>
		</body>
	</html>
</xsl:template>
	
<xsl:template match="lien">
	<a href="{@href}"><xsl:value-of select="."/></a>
</xsl:template>	

</xsl:stylesheet>
