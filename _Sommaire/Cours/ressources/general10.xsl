<?xml version="1.0" encoding="UTF-8"?>
<!-- Collection de templates gérant les parties communes des feuilles XSL -->
<!-- Version 1.1 du 19/11/2008
	- Passage en licence CC-by-sa
-->
<!-- Version 1.06 du 27/09/2007
	- Automatisation du calcul de l'année (fonction exslt date:year())
-->
<!-- Version 1.05 du 10/09/2007 
	- Changement de l'adresse principale du site : Free->gchagnon.fr
-->
<!-- Version 1.04 du 24/09/2006
	- Changement des feuilles de style pour le cours en ligne (Jussieu)
-->
<!-- Version 1.03 du 17/09/2006
	- Ajout du lien vers apropos.html.
-->
<!-- Version 1.02 du 11/02/2006
	- Correction de l'URL de base pour le moteur de recherche sur le cours en ligne.
-->
<!-- Version 1.01 du 06/11/2005
	- Ajout du sujet automatique dans l'envoi de courriel.
	- Mise en commun des ressources des cours.
-->
<!-- Version 1.0 du 10/10/2005
	- Création
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"                    xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	
	<!--valeurs possibles: siteweb pour le site sur gchagnon.fr; coursenligne pour le... cours en ligne à l'UPMC -->
	<xsl:variable name="destination" select="'coursenligne'"/>
	<xsl:variable name="location" select="concat(/chapitre/@typecourssiteweb,/cours/@typecourssiteweb)"/>
	
	<xsl:include href="../ressources/calendrier.xsl"/>
	
	<xsl:template name="gen_menugeneral">
		<xsl:param name="destination"/>
		<ul id="menugeneral">
			<xsl:if test="$destination='siteweb'"><li><a href="../index.html" accesskey="1" title="Tous les cours du site" tabindex="1">Tous les cours</a></li></xsl:if>
			<li><a href="#licence" accesskey="8" tabindex="2">Conditions d'utilisation</a></li>
			<xsl:if test="$destination='siteweb'"><li><a href="../ressources/apropos.html">À propos de ces cours</a></li></xsl:if>
			<xsl:choose>
				<xsl:when test="$destination='siteweb'"><li><a href="mailto:cours@gchagnon.fr?subject=[{document(concat('../',$location,'/','cours.xml'))/cours/titre}]" accesskey="7" title="Envoyer un courriel à l'auteur" tabindex="3">Contact</a></li></xsl:when>
				<xsl:when test="$destination='coursenligne'"><li><a href="mailto:Gilles.Chagnon@upmc.fr?subject=[{document(concat('../',$location,'/','cours.xml'))/cours/titre}]" accesskey="7" title="Envoyer un courriel à l'auteur" tabindex="3">Contact</a></li></xsl:when>
				<xsl:otherwise><li><a href="mailto:cours@gchagnon.fr?subject=[{document(concat('../',$location,'/','cours.xml'))/cours/titre}]" accesskey="7" title="Envoyer un courriel à l'auteur" tabindex="3">Contact</a></li></xsl:otherwise>
			</xsl:choose>
		</ul>
	</xsl:template>
	
	<xsl:template name="gen_AppelFeuillesDeStyle">
		<xsl:param name="destination"/>
		<xsl:choose>
			<xsl:when test="$destination='siteweb'">
				<xsl:variable name="feuille" select="'forme3'"/>
				<link rel="stylesheet" type="text/css" href="../ressources/menu.css"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, '.css')}"/>
				<link rel="stylesheet" type="text/css" href="../ressources/tablemat.css"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, 'screen.css')}" media="screen"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, 'print.css')}" media="print"/>
			</xsl:when>  
			<xsl:when test="$destination='coursenligne'">
				<xsl:variable name="feuille" select="'forme4'"/>
				<link rel="stylesheet" type="text/css" href="../ressources/menu4.css"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, '.css')}"/>
				<link rel="stylesheet" type="text/css" href="../ressources/tablemat4.css"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, 'screen.css')}" media="screen"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, 'print.css')}" media="print"/>
			</xsl:when>  
			<xsl:otherwise>
				<xsl:variable name="feuille" select="'forme3'"/>
				<link rel="stylesheet" type="text/css" href="../ressources/menu.css"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, '.css')}"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, 'screen.css')}" media="screen"/>
				<link rel="stylesheet" type="text/css" href="../ressources/{concat($feuille, 'print.css')}" media="print"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="gen_entete">
		<xsl:param name="destination"/>
		<xsl:param name="titre"/>
		<div id="entete">
			<h1><xsl:value-of select="document(concat('../',$location,'/','cours.xml'))/cours/titre"/><xsl:if test="not($titre='non')">&#160;- <xsl:value-of select="$titre"/></xsl:if></h1>
			<p><span class="version">version <xsl:call-template name="gen_determineVersion"><xsl:with-param name="fichier" select="//cours/@nomfichier"/><xsl:with-param name="date" select="document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[1]/@date"/></xsl:call-template></span>, dernière mise à jour le <xsl:call-template name="gen_determineDateVersion"><xsl:with-param name="fichier" select="//cours/@nomfichier"/></xsl:call-template>.</p>		
			<xsl:choose>
				<xsl:when test="$destination='siteweb'"><form action="http://www.google.com/search" id="recherche"><p><label for="formrecherche">Chercher dans le cours&#160;:</label>&#160;<input name="q" type="text" size="10" accesskey="4" tabindex="4" id="formrecherche"/><input type="hidden" name="q" value="site:www.gchagnon.fr/cours/{document(concat('../',$location,'/','cours.xml'))/cours/@typecourssiteweb}/"/>&#160;<input type="image" src="images/recherche3.png" alt="Chercher" value="Chercher"/></p></form></xsl:when>
				<xsl:when test="$destination='coursenligne'"><form action="http://www.google.com/search" id="recherche"><p><label for="formrecherche">Chercher dans le cours&#160;:</label>&#160;<input name="q" type="text" size="10" accesskey="4" tabindex="4" id="formrecherche"/><input type="hidden" name="q" value="site:www.licence.elec.upmc.fr/S_tec/coursEnLigne/{document(concat('../',$location,'/','cours.xml'))/cours/@typecoursenligne}/"/>&#160;<input type="image" src="images/recherche_vert2.png" alt="Chercher" value="Chercher"/></p></form></xsl:when>
				<xsl:otherwise><form action="http://www.google.com/search" id="recherche"><p><label for="formrecherche">Chercher dans le cours&#160;:</label>&#160;<input name="q" type="text" size="10" accesskey="4" tabindex="4" id="formrecherche"/><input type="hidden" name="q" value="site:www.gchagnon.fr/cours/{document(concat('../',$location,'/','cours.xml'))/cours/@typecourssiteweb}/"/>&#160;<input type="image" src="images/recherche3.png" alt="Chercher" value="Chercher"/></p></form></xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	
	<xsl:template name="gen_licence">
		<div id="licence">
			<h2>Conditions d'utilisation et licence</h2>
			<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br />Cette cr&#233;ation est mise &#224; disposition sous un <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">contrat Creative Commons</a>.
			<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template name="gen_determineVersion">
		<xsl:param name="fichier"/>
		<xsl:param name="date"/>
		<xsl:variable name="date2" select="number(translate($date,'-',''))"/>
		<xsl:choose>
			<xsl:when test="$fichier='cours'">
				<xsl:variable name="unité" select="count(document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='1'])"/>
				<xsl:variable name="dixième" select="count((document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='1'])[1]/preceding::quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='2'][1])"/>
				<xsl:variable name="centième" select="count((document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='1' or @type='2'])[1]/preceding::quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='3'][1])"/>
				<xsl:variable name="lettre" select="translate(string(count((document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='1' or @type='2' or @type='3'])[1]/preceding::quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='4'][1])),'1234567890','bcdefghij')"/>
				<xsl:value-of select="concat($unité,'.',$dixième,$centième,$lettre)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="unité" select="count(document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='2' and @où=$fichier])"/>
				<xsl:variable name="dixième" select="count((document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='2' and @où=$fichier])[1]/preceding::quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@type='3' and @où=$fichier])"/>
				<xsl:variable name="centième" select="count((document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@où=$fichier and (@type='2' or @type='3')])[1]/preceding::quand[$date2 &gt;= number(translate(@date,'-',''))]/maj[@où=$fichier and @type='4'])"/>
				<xsl:value-of select="concat($unité,'.',$dixième,$centième)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="gen_determineDateVersion">
		<xsl:param name="fichier"/>
		<xsl:choose>
			<xsl:when test="$fichier='cours'"><xsl:call-template name="cal_dateSchemaVersDateCalendrier"><xsl:with-param name="date" select="document(concat('../',$location,'/','historique.xml'))/misesAJour/quand[1]/@date"/></xsl:call-template></xsl:when>
			<xsl:otherwise><xsl:call-template name="cal_dateSchemaVersDateCalendrier"><xsl:with-param name="date" select="(document(concat('../',$location,'/','historique.xml'))/misesAJour/quand/maj[@où=$fichier])[1]/parent::quand/@date"/></xsl:call-template></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
