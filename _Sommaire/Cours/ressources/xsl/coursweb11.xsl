<?xml version="1.0" encoding="ISO-8859-1" ?>
<!-- Version 1.14 du 19/04/2005
 	- Ajout d'un sujet automatique dans l'envoi du courriel.
-->
<!-- Version 1.13 du 17/03/2005 
 	- Configuration d'un num�ro de page particulier pour la TdM dans le Weborama
 -->
<!-- Version 1.12 du 06/02/2005
 	- D�tail de l'historique.
 -->
<!-- Version 1.11 du 02/02/2005
 	- Modification de l'xsl:output (il manquait l'URI de la DTD de HTML).
 -->
<!-- Version 1.1 du 20/10/2004
 	- Permet de s�lectionner si la sortie est destin� au cours en ligne ou au web.
 -->
<!-- Version 1.01 du 06/10/2004
            - Ajout de la Licence de Documentation Libre GNU.
 -->

<!-- Version 1.0 du 23/05/2004
		- Cr�ation.
-->

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
<!--<xsl:output method="xml" version="xhtml 1.0" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>-->

	<xsl:template match="/">
    <!--valeurs possibles: siteweb pour le site sur Free; coursenligne pour le... cours en ligne � l'UPMC -->
                        <xsl:variable name="destination" select="'siteweb'"/>
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
			<xsl:choose>
			    <xsl:when test="$destination='siteweb'">
			        <xsl:variable name="feuille" select="'forme1'"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'cours.css')}"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'coursscreen.css')}" media="screen"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'coursprint.css')}" media="print"/>
			    </xsl:when>  
			    <xsl:when test="$destination='coursenligne'">
			        <xsl:variable name="feuille" select="'forme2'"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'cours.css')}"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'coursscreen.css')}" media="screen"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'coursprint.css')}" media="print"/>
			    </xsl:when>  
			    <xsl:otherwise>
			        <xsl:variable name="feuille" select="'forme1'"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'cours.css')}"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'coursscreen.css')}" media="screen"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'coursprint.css')}" media="print"/>
			    </xsl:otherwise>
			</xsl:choose>
		</head>
		<body>
			<div id="entete">
				<h1><xsl:value-of select="//titre"/></h1>
				<p><b>v. <xsl:value-of select="//maj[1]/@version"/></b>, derni�re <a href="#listemaj">mise � jour</a> le <xsl:value-of select="//maj[1]/quand"/>.</p>
			</div>
			<div id="tablematcourte">
				<h3>Table des mati�res par t�tes de chapitre</h3>
				<ol>
				<xsl:for-each select="/cours/plan/chapitre">
					<li><h4><xsl:element name="a"><xsl:attribute name="href">#<xsl:value-of select="@href"/></xsl:attribute><xsl:attribute name="title"><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/resume"/></xsl:attribute><xsl:attribute name="tabindex"><xsl:number from="/" level="single" format="1" value="position()"/></xsl:attribute><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/titre"/></xsl:element>
					</h4></li>
				</xsl:for-each>
				    <li><h4><a href="license.html">GNU Free Documentation License</a></h4></li>
				</ol>
				<hr />
				<p><a href="exercices.html">Exercices</a></p>
			    <xsl:choose>
			        <xsl:when test="$destination='siteweb'">
				<hr />
			        	<p>Auteur: <a href="mailto:Gilles.Chagnon@free.fr?subject=[{cours/titre}] "><xsl:value-of select="//auteur/identite"/></a></p>
				<hr />
				<p><a href="../index.html">Tous les cours</a></p>
				<hr/>
				<!--DEBUT GOLD WEBORAMA-->
					<script type="text/javascript">
						//<![CDATA[
							WEBO_ZONE=]]><xsl:value-of select="document('weborama.xml')/zone/@numero"/><![CDATA[; 
							WEBO_PAGE=]]><xsl:value-of select="document('weborama.xml')/zone/@toc"/><![CDATA[; 
							webogold_ok=0;
						//]]>
					</script>
					<script src="http://script.weborama.fr/gold.js" type="text/javascript"></script>
					<script type="text/javascript">
						//<![CDATA[
							if(webogold_ok==1){webogold_zpi(WEBO_ZONE,WEBO_PAGE,2917);}
						//]]>
					</script> <!--FIN GOLD WEBORAMA-->
			        </xsl:when>
			        <xsl:when test="$destination='coursenligne'">
				<hr />
			        	<p>Auteur: <a href="mailto:Gilles.Chagnon@upmc.fr?subject=[{cours/titre}] "><xsl:value-of select="//auteur/identite"/></a></p>
			        </xsl:when>
			        <xsl:otherwise>
			            <hr />
			        	<p>Auteur: <a href="mailto:Gilles.Chagnon@free.fr?subject=[{cours/titre}] "><xsl:value-of select="//auteur/identite"/></a></p>
			        </xsl:otherwise>
			    </xsl:choose>
			</div>
			<div id="main">
				<div id="tablematlongue">
					<h2>Table des mati�res</h2>
					<xsl:for-each select="/cours/plan/chapitre">
						<xsl:variable name="fichier" select="concat(@href,'.html')"/>
						<a name="{@href}"></a><h3><xsl:number from="/" level="single" format="A." lang="fr"/> 
								<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="@href"/>.html</xsl:attribute><xsl:attribute name="tabindex"><xsl:number from="/" level="single" format="1" value="position()+count(//chapitre)"/></xsl:attribute><xsl:value-of select="document(concat(@href,'.xml'))/chapitre/entete/titre"/></xsl:element></h3>
						<xsl:for-each select="document(concat(@href,'.xml'))/chapitre/corpus/partie">
							<h4><xsl:number from="/" level="single" format="I."/>
									<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h4>
							<xsl:for-each select="section">
								<h5><xsl:number from="/" level="single" format="1."/>
									<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="concat($fichier,'#',@ancre)"/></xsl:attribute><xsl:value-of select="@titre"/></xsl:element></h5>
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
				<div id="maj">
					<a name="listemaj"></a><h4>Historique succinct du cours:</h4>
					<dl>
					<xsl:for-each select="//maj[string-length(@version)=3]">
						<dt>Le <xsl:value-of select="quand"/>, par <xsl:value-of select="qui"/> (v. <xsl:value-of select="@version"/>):</dt>
						<dd>
							<ul>
							<xsl:for-each select="quoi">
								<li><xsl:value-of select="."/></li>
							</xsl:for-each>
							</ul>
						</dd>
					</xsl:for-each>
					</dl>
					<p>Pour plus de d�tails, consulter l'<a href="historique.html">historique d�taill�</a>.</p>
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
