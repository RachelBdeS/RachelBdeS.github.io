<?xml version="1.0" encoding="UTF-8"?>
<!-- Version 2.0C du 19/12/2012
	- Ajout de la prise en compte de l'attribut optionnel caractère de l'élément finligne.
-->
<!-- Version 2.0B du 12/01/12
	- Ajout de l'indentation dans le code JavaScript
-->
<!-- Version 2.0A du 20/09/2009
	- Test de la présence de l'ancre correspondante en cas de création de lien interne au document.
-->
<!-- Version 2.09 du 11/03/2008
	- Réécrire du template indentation pour le remplacer par un appel récursif.
-->
<!-- Version 2.08 du 29/02/2008
	- Ajout d'ancres pour Internet Explorer
	- Prise en compte de l'élément commentaireCSS
-->
<!-- Version 2.07 du 01/10/2007
	- Ajout des éléments contenu et puissance
	- Ajout de l'attribut new de l'élément declaration
	- Ajout de l'élément commentaire_js
-->
<!-- Version 2.06 du 27/09/2007
	- Automatisation du calcul de l'année (fonction exslt date:year()). Ajout de la bibliographie.
-->
<!-- Version 2.05 du 19/09/2007
	- Ajout de l'élément abreviation
-->
<!-- Version 2.04 du 18/03/2007
	- Correction de l'emploi de l'élément caption
-->
<!-- Version 2.03 du 09/05/2006
	- Mise à jour du copyright pour 2006.
	- Teste si présence de l'attribut headers dans les cellules de tableau
-->
<!-- Version 2.02 du 06/11/2005
	- Suppression de l'élément espace.
	- Mise en commun des ressources des cours.
-->
<!-- Version 2.01 du 31/10/2005
	- Correction du calcul de la numérotation des tableaux. 
	- Correction des liens vers les cours précédent et suivant.
-->
<!-- Version 2.0 du 10/10/2005
	- Création.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"                xmlns:date="http://exslt.org/dates-and-times" extension-element-prefixes="date">
	<xsl:import href="../ressources/general11.xsl"/>
	
	<xsl:output method="html" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:variable name="nomfic" select="//cours/@nomfichier"/>
	
	<xsl:template match="/">
		
		<html lang="fr">
			<head>
				<title><xsl:value-of select="chapitre/entete/titre"/></title>
				<xsl:element name="meta">
					<xsl:attribute name="name">author</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//auteur"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">keywords</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//motsclefs"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">description</xsl:attribute>
					<xsl:attribute name="content"><xsl:value-of select="//resume"/></xsl:attribute>
				</xsl:element>
				<xsl:if test="document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/following-sibling::chapitre[1]"><link rel="next" href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/following-sibling::chapitre[1]/@href,'.html')}"/></xsl:if>
				<xsl:if test="document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/preceding-sibling::chapitre[1]"><link rel="prev" href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/preceding-sibling::chapitre[1]/@href,'.html')}"/></xsl:if>
				<link rel="contents" href="toc.html" type="text/html"/>
				<link rel="up" href="index.html" type="text/html"/>
				<link rel="first" href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème[1]/chapitre[1]/@href, '.html')}" type="text/html"/>
				<link rel="last" href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème[last()]/chapitre[last()]/@href, '.html')}" type="text/html"/>
				<xsl:call-template name="gen_AppelFeuillesDeStyle"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
			</head>
			<body>
				
				<xsl:call-template name="gen_menugeneral"><xsl:with-param name="destination" select="$destination"/></xsl:call-template>
				<xsl:call-template name="gen_entete"><xsl:with-param name="destination" select="$destination"/><xsl:with-param name="titre" select="chapitre/entete/titre"/></xsl:call-template>
				<xsl:call-template name="menu"/>
				<xsl:call-template name="tablemat"/>
				<xsl:call-template name="contenu"/>
				<xsl:call-template name="navigation"/>
				<xsl:call-template name="historique"/>
				<xsl:if test="document(concat('../',$location,'/','cours.xml'))//bibliographie"><xsl:call-template name="biblio"/></xsl:if>
				<xsl:call-template name="gen_licence"/>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="menu">
		<ul id="menu">
			<li class="page"><a href="#tablemat" tabindex="6">Table des matières (<abbr title="Table des Matières">TdM</abbr>)</a></li>
			<li class="page"><a href="#contenu" accesskey="s" tabindex="7">Contenu</a></li>
			<li class="page"><a href="#historique" title="Historique de ce document" tabindex="8">Historique</a></li>
			<xsl:if test="document(concat('../',$location,'/','cours.xml'))/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]"><li class="cours"><a href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.html')}" title="Cours suivant : {document(concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.xml'))//titre}">Cours suivant</a></li></xsl:if>
			<xsl:if test="document(concat('../',$location,'/','cours.xml'))/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]"><li class="cours"><a href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.html')}" title="Cours précédent : {document(concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.xml'))//titre}">Cours précédent</a></li></xsl:if>
			<li class="cours"><a href="exercices.html">Exercices</a></li>
			<li class="cours"><a href="index.html" tabindex="9">Accueil du cours</a></li>
		</ul>		
	</xsl:template>
	
	<xsl:template name="contenu">
		<div id="contenu">
			<h2>Contenu du cours</h2>
			<xsl:for-each select="//partie">
				<h3><a name="{@ancre}" href="#{@ancre}" id="{@ancre}"></a><xsl:number from="/" level="single" format="I. "/><xsl:value-of select="@titre"/></h3>
				<xsl:for-each select="*">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template name="tablemat">
		<div id="tablemat">
			<h2>Table des matières (<abbr title="Table des Matières">TdM</abbr>)</h2>
			<xsl:for-each select="//partie">
				<xsl:if test="position() mod 2=1"><div class="impair"><xsl:call-template name="tdm"/></div></xsl:if>
				<xsl:if test="position() mod 2=0"><div class="pair"><xsl:call-template name="tdm"/></div></xsl:if>
			</xsl:for-each>
			<p class="retourhaut"><a href="#menu">Retour au menu</a></p>
		</div>
	</xsl:template>
	
	<xsl:template name="tdm">
		<ol>
			<li><xsl:number from="/" level="single" format="I. "/><a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a>
					<xsl:if test="section | exercice"><ol>
						<xsl:for-each select="section | exercice">
							<xsl:choose>
								<xsl:when test="local-name(.)='section'">
									<li><a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a>
										<xsl:if test="paragraphe/@titre | exercice"><ol><xsl:for-each select="paragraphe | exercice">
											<xsl:choose>
												<xsl:when test="local-name(.)='paragraphe'">
													<xsl:if test="@titre"><li><xsl:choose><xsl:when test="@ancre"><a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a></xsl:when><xsl:otherwise><xsl:value-of select="@titre"/></xsl:otherwise></xsl:choose></li></xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<li>Exercice&#160;: <a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a></li>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										</ol></xsl:if>
									</li>
								</xsl:when>
								<xsl:otherwise>
									<li>Exercice&#160;: <a href="#{@ancre}"><xsl:value-of select="@titre"/></a></li>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</ol></xsl:if>
			</li>
		</ol>
	</xsl:template>
	
	<xsl:template name="navigation">
		<div id="navigation">
			<p><a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a>Cette cr&#233;ation est mise &#224; disposition par Gilles Chagnon sous un <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">contrat Creative Commons</a>.</p>
			<p><xsl:if test="document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/preceding-sibling::chapitre[1]">Cours précédent&#160;: <a href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/preceding-sibling::chapitre[1]/@href,'.html')}"><xsl:value-of select="document(concat('../',$location,'/',concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/preceding-sibling::chapitre[1]/@href,'.xml')))//titre"/></a><br/></xsl:if>
				<xsl:if test="document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/following-sibling::chapitre[1]">Cours suivant&#160;: <a href="{concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/following-sibling::chapitre[1]/@href,'.html')}"><xsl:value-of select="document(concat('../',$location,'/',concat(document(concat('../',$location,'/','cours.xml'))/cours/plan/thème/chapitre[@href=$nomfic]/following-sibling::chapitre[1]/@href,'.xml')))//titre"/></a></xsl:if></p>
			<p>Liste des fichiers associés à ce fichier HTML&#160;:</p>
			<ul>
				<li><a href="{concat(//cours/@nomfichier, '.xml')}">Fichier XML</a></li>
				<li><a href="../ressources/chapitre22.dtd">DTD du cours</a></li>
				<li><a href="../ressources/chapitreweb20.xsl">Feuille de style XSL</a></li>
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template name="historique">
		<div id="historique">
			<h2>Historique de ce document</h2>
			<ul>
				<xsl:for-each select="document(concat('../',$location,'/','historique.xml'))/misesAJour/quand/maj[@où=$nomfic]">
					<li>Le <xsl:call-template name="cal_dateSchemaVersDateCalendrier"><xsl:with-param name="date" select="../@date"/></xsl:call-template>, version <xsl:call-template name="gen_determineVersion"><xsl:with-param name="fichier" select="$nomfic"/><xsl:with-param name="date" select="../@date"/></xsl:call-template>. <xsl:value-of select="."/></li>
				</xsl:for-each>
			</ul>
		</div>
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
	
	<xsl:template match="section">
		<h4><a name="{@ancre}" id="{@ancre}" href="#{@ancre}"></a><xsl:number from="/" level="single" format="1. "/><xsl:value-of select="@titre"/></h4>
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<p class="retourtdm"><a href="#tdm_{@ancre}" title="Retour à la TdM ({@titre})">&gt;Retour à la <abbr>TdM</abbr></a></p>
	</xsl:template>
	
	<xsl:template match="paragraphe">
		<xsl:if test="@titre">
			<h5><xsl:if test="@ancre"><a href="#{@ancre}" name="{@ancre}" id="{@ancre}"></a></xsl:if><xsl:number from="/" level="single" format="a. "/><xsl:value-of select="@titre"/></h5>
		</xsl:if>
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:if test="local-name(following-sibling::*[1])='paragraphe'"><p class="retourtdm"><a href="#tdm_{@ancre}" title="Retour à la TdM ({@titre})">&gt;Retour à la <abbr>TdM</abbr></a></p></xsl:if>
	</xsl:template>
	
	<xsl:template match="tableau">
		<table class="tableau">
			<xsl:choose>
				<xsl:when test="legende"><xsl:attribute name="summary"><xsl:value-of select="legende"/></xsl:attribute></xsl:when>
				<xsl:otherwise><xsl:attribute name="summary"></xsl:attribute></xsl:otherwise>
			</xsl:choose>
			<xsl:if test="@bordure"><xsl:attribute name="border"><xsl:value-of select="@bordure"/></xsl:attribute></xsl:if>
			<xsl:for-each select="groupecolonne"><xsl:element name="col"><xsl:attribute name="span"><xsl:value-of select="@nombre"/></xsl:attribute><xsl:attribute name="largeur"><xsl:value-of select="@largeur"/></xsl:attribute></xsl:element></xsl:for-each>
			<xsl:for-each select="ligne">
				<tr><xsl:for-each select="colonne">
					<xsl:if test="../@type='header'"><xsl:element name="th"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if><xsl:if test="@abbr"><xsl:attribute name="abbr"><xsl:value-of select="@abbr"/></xsl:attribute></xsl:if><xsl:apply-templates select="node()"/></xsl:element></xsl:if>
					<xsl:if test="../@type='normal'"><td><xsl:if test="@headers"><xsl:attribute name="headers"><xsl:value-of select="@headers"/></xsl:attribute></xsl:if><xsl:apply-templates select="node()"/></td></xsl:if>
				</xsl:for-each></tr>
			</xsl:for-each>
		</table>
		<p class="legende">Table&#160;<xsl:value-of select="count(preceding::tableau)+1"/>. <xsl:if test="legende"><xsl:apply-templates select="legende"/></xsl:if>
		</p>
	</xsl:template>
	
	<xsl:template match="liste">
		<xsl:choose>
			<xsl:when test="@type='envrac'">
				<ul>
					<xsl:for-each select="item">
						<li><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></li>
					</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:when test="@type='ordonnee'">
				<ol>
					<xsl:for-each select="item">
						<li><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></li>
					</xsl:for-each>
				</ol>
			</xsl:when>
			<xsl:when test="@type='sanspuce'">
				<ul>
					<xsl:attribute name="class">sanspuce</xsl:attribute>
					<xsl:for-each select="item">
						<li><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></li>
					</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:otherwise>
				<ul>
					<xsl:for-each select="item">
						<li><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each><xsl:if test="not(child::liste[position()=last()])"><xsl:if test="position()=last()">.</xsl:if><xsl:if test="not(position()=last())"> ;</xsl:if></xsl:if></li>
					</xsl:for-each>
				</ul>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="définitions">
		<dl>
			<xsl:for-each select="*">
				<xsl:apply-templates select="."/>
			</xsl:for-each>	
		</dl>
	</xsl:template>
	<xsl:template match="terme">
		<dt><xsl:apply-templates/></dt>
	</xsl:template>
	<xsl:template match="def">
		<dd><xsl:apply-templates/></dd>
	</xsl:template>
	
	<xsl:template match="image">
		<span class="image"><xsl:element name="img">
			<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
			<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
			<xsl:attribute name="width"><xsl:value-of select="@largeur"/></xsl:attribute>
			<xsl:attribute name="height"><xsl:value-of select="@hauteur"/></xsl:attribute>
			<xsl:attribute name="class"><xsl:value-of select="@classe"/></xsl:attribute>
		</xsl:element>
		</span>
		<xsl:if test="legende"><p class="legende"><xsl:apply-templates select="legende"/></p></xsl:if>
	</xsl:template>
	
	<xsl:template match="imagereactive">
		<span class="image">
			<xsl:element name="img">
				<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
				<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
				<xsl:attribute name="width"><xsl:value-of select="@largeur"/></xsl:attribute>
				<xsl:attribute name="height"><xsl:value-of select="@hauteur"/></xsl:attribute>
				<xsl:attribute name="usemap">#<xsl:value-of select="@nom"/></xsl:attribute>
			</xsl:element>
			<xsl:element name="map">
				<xsl:attribute name="name"><xsl:value-of select="@nom"/></xsl:attribute>
				<xsl:for-each select="zone">
					<!--<xsl:element name="area">
						<xsl:attribute name="shape"><xsl:value-of select="@forme"/></xsl:attribute>
						<xsl:attribute name="coords"><xsl:value-of select="@coords"/></xsl:attribute>
						<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
						<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
						</xsl:element>-->
					<area shape="{@forme}" coords="{@coords}" href="{@href}" alt="{@alt}" />
				</xsl:for-each>
			</xsl:element>
		</span>
		<xsl:if test="legende"><p class="legende"><xsl:apply-templates select="legende"/></p></xsl:if>
	</xsl:template>
	
	<xsl:template match="texte">
		<p><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></p>
	</xsl:template>
	
	<xsl:template match="legende">
		<xsl:for-each select="node()">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="autrelangue">
		<xsl:element name="span">
			<xsl:attribute name="lang"><xsl:value-of select="@type"/></xsl:attribute>
			<xsl:attribute name="class">autrelangue</xsl:attribute>
			<xsl:value-of select="."/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="acronyme">
		<acronym title="{@titre}"> <xsl:value-of select="." /> </acronym>
	</xsl:template>
	
	<xsl:template match="abreviation">
		<abbr title="{@titre}"> <xsl:value-of select="." /> </abbr>
	</xsl:template>
	
	<xsl:template match="index">
		<a name="{@id}"></a>
		<span class="index" style="display: none"><xsl:value-of select="."/></span>
	</xsl:template>
	
	<xsl:template match="code">
		<xsl:choose>
			<xsl:when test="@option='yes'"><i><code class="{@type}"><xsl:value-of select="."/></code></i></xsl:when>
			<xsl:otherwise><code class="{@type}"><xsl:value-of select="."/></code></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="logiciel">
		<code class="logiciel"><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></code>
	</xsl:template>
	
	<xsl:template match="exemple">
		<xsl:choose>
			<xsl:when test="@type='XML'">
				<p class="xml"><xsl:apply-templates/>	</p>
			</xsl:when>
			<xsl:when test="@type='HTML'">
				<p class="html"><xsl:apply-templates/></p>
			</xsl:when>
			<xsl:otherwise>
				<pre><xsl:value-of select="."/></pre>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="cdat">
		<span class="exemplecdata">&lt;![CDATA[<span class="valeurattribut"><xsl:value-of select="."/></span>]]&gt;</span>
	</xsl:template>
	
	<xsl:template match="exemple_css">
		<p class="css"><xsl:apply-templates/></p>
	</xsl:template>
	
	<xsl:template match="commentaire">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"></xsl:with-param></xsl:call-template>
		<span class="commentaire">&lt;!--&#160;<xsl:value-of select="."/>&#160;--&gt;</span><br/>
	</xsl:template>
	
	<xsl:template match="prologue">
		<span class="enteteexemplexml">&lt;?xml version="<xsl:value-of select="@version"/>" encoding="<xsl:value-of select="@encodage"/>"<xsl:if test="@standalone">&#160;standalone="<xsl:value-of select="@standalone"/>"</xsl:if>?&gt;</span><br/>
	</xsl:template>
	
	<xsl:template match="instruction_traitement">
		<span class="instructiontraitement">&lt;?<xsl:value-of select="@nom"/> type="<span class="valeurattribut"><xsl:value-of select="@type"/></span>"  href="<span class="valeurattribut"><xsl:value-of select="@href"/></span>"?&gt;<br /></span>
	</xsl:template>
	
	<xsl:template match="typedocument">
		<span class="exempledtdexterne">&lt;!DOCTYPE <xsl:value-of select="@nomracine"/><xsl:value-of select="concat(' ',@type)"/><xsl:if test="@identifiant"><span class="valeurattribut"><xsl:value-of select="concat(' &quot;',@identifiant,'&quot;')"/></span></xsl:if><span class="valeurattribut"><xsl:value-of select="concat(' &quot;',@href,'&quot;')"/></span>&gt;<br/></span>
	</xsl:template>
	
	<xsl:template match="typedocument_interne">
		<span class="exempledtdinterne">&lt;!DOCTYPE <xsl:value-of select="@nomracine"/>[</span><br/><xsl:apply-templates /><span class="exempledtdinterne">]&gt;</span><br />
	</xsl:template>
	
	<xsl:template match="element">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<xsl:choose>
			<xsl:when test="@vide='oui'"><span class="tag">&lt;<xsl:value-of select="@nom"/><xsl:if test="attribut"><xsl:apply-templates select="attribut"/></xsl:if><xsl:if test="ancestor::exemple/@type='XML'">&#160;/</xsl:if>&gt;</span><xsl:if test="@enligne='non'"><br/></xsl:if></xsl:when>
			<xsl:when test="@vide='non'">
				<span class="tag">&lt;<xsl:value-of select="@nom"/><xsl:if test="attribut"><xsl:apply-templates select="attribut"/></xsl:if>&gt;</span><xsl:if test="@indent='oui'"><br/></xsl:if>
				<xsl:for-each select="node()">
					<xsl:if test="not(local-name(.)='attribut')"><xsl:apply-templates select="."/></xsl:if>
				</xsl:for-each>
				<xsl:if test="@indent='oui'"><xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template></xsl:if><span class="tag">&lt;/<xsl:value-of select="@nom"/>&gt;</span><xsl:if test="@enligne='non'"><br/></xsl:if>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="contenu">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"></xsl:with-param></xsl:call-template><xsl:value-of select="."/><br/>
	</xsl:template>
	
	<xsl:template match="attribut"><span class="nomattribut"><xsl:value-of select="concat(' ',@nom)"/></span><xsl:if test="@pseudo='non'">="<span class="valeurattribut"><xsl:value-of select="."/></span>"</xsl:if></xsl:template>
	
	<xsl:template match="declaration_element">
		<span class="exempledtdelement">&lt;!ELEMENT</span>&#160;<span class="tag"><xsl:value-of select="@nom"/></span>&#160;<span class="valeurattribut"><xsl:value-of select="@type"/></span><span class="dtdelement">&gt;</span><br/>
		<xsl:if test="declaration_attribut">
			<xsl:choose>
				<xsl:when test="not(declaration_attribut[2])"><xsl:call-template name="indentation"><xsl:with-param name="valeur">1</xsl:with-param></xsl:call-template><span class="exempledtdattribut">&lt;!ATTLIST</span>&#160;<span class="tag"><xsl:value-of select="@nom"/></span>&#160;<span class="nomattribut"><xsl:value-of select="declaration_attribut[1]/@nomattr"/></span>&#160;<span class="valeurattribut"><xsl:value-of select="declaration_attribut[1]/@valeur"/></span>&#160;<xsl:choose><xsl:when test="declaration_attribut[1]/@type='IMPLIED'"><span class="typeattribut">#IMPLIED</span></xsl:when><xsl:when test="declaration_attribut[1]/@type='REQUIRED'"><span class="typeattribut">#REQUIRED</span></xsl:when><xsl:when test="declaration_attribut[1]/@type='FIXED'"><span class="typeattribut">#FIXED</span>&#160;<span class="valeurattribut">"<xsl:value-of select="declaration_attribut[1]/@defaut"/>"</span></xsl:when><xsl:otherwise><span class="valeurattribut">"<xsl:value-of select="declaration_attribut[1]/@defaut"/>"</span></xsl:otherwise></xsl:choose><span class="exempledtdattribut">&gt;</span></xsl:when>
				<xsl:otherwise><span class="exempledtdattribut"><xsl:call-template name="indentation"><xsl:with-param name="valeur">1</xsl:with-param></xsl:call-template>&lt;!ATTLIST</span>&#160;<span class="tag"><xsl:value-of select="@nom"/></span><br/>
					<xsl:for-each select="declaration_attribut">
						<xsl:call-template name="indentation">
							<xsl:with-param name="valeur">2</xsl:with-param>
						</xsl:call-template>
						<span class="nomattribut"><xsl:value-of select="@nomattr"/></span>&#160;<span class="valeurattribut"><xsl:value-of select="@valeur"/></span>&#160;<xsl:choose><xsl:when test="@type='IMPLIED'"><span class="typeattribut">#IMPLIED</span></xsl:when><xsl:when test="@type='REQUIRED'"><span class="typeattribut">#REQUIRED</span></xsl:when><xsl:when test="@type='FIXED'"><span class="typeattribut">#FIXED</span>&#160;<span class="valeurattribut">"<xsl:value-of select="@defaut"/>"</span></xsl:when><xsl:otherwise><span class="valeurattribut">"<xsl:value-of select="@defaut"/>"</span></xsl:otherwise></xsl:choose><br/></xsl:for-each><span class="exempledtdattribut"><xsl:call-template name="indentation"><xsl:with-param name="valeur">1</xsl:with-param></xsl:call-template>&gt;</span></xsl:otherwise>
			</xsl:choose><br/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="declaration_entite">
		<span class="exempledtdelement">&lt;!ENTITY</span><xsl:if test="@type='paramétrique'">&#160;%</xsl:if>&#160;<span class="tag"><xsl:value-of select="@nom"/></span><xsl:choose><xsl:when test="@syspub='system'">&#160;SYSTEM</xsl:when><xsl:when test="@syspub='public'">&#160;PUBLIC</xsl:when></xsl:choose>&#160;<span class="valeurattribut">"<xsl:value-of select="@valeur"/>"</span><xsl:if test="@identifiant">&#160;"<xsl:value-of select="@identifiant"/>"</xsl:if><span class="dtdelement">&gt;</span><br/>
	</xsl:template>
	
	<xsl:template match="commentaireCSS"><span class="commentaire">/*&#160;<xsl:value-of select="."/>&#160;*/</span><br /></xsl:template>
	
	<xsl:template match="csselt">
		<span class="selecteur"><xsl:value-of select="selecteur"/></span><br />
		&#160;&#160;&#160;&#160;{<br />
		<xsl:for-each select="prop">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span class="csspropriete"><xsl:value-of select="@nom"/></span><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <span class="cssvaleur"><xsl:value-of select="@valeur"/></span>;<br />
		</xsl:for-each>
		&#160;&#160;&#160;&#160;}<br /><br />
	</xsl:template>
	
	<xsl:template match="exercice">
		<h4>Exercice&#160;<a name="{@ancre}" href="#{@ancre}" id="{@ancre}"></a><xsl:number from="/" level="single" format="1. "/><xsl:value-of select="@titre"/></h4>
		<xsl:if test="remarque"><p><xsl:value-of select="remarque"/></p></xsl:if>
		<h5><a href="{enonce/@href}" title="Énoncé de l'exercice '{@titre}'">Énoncé</a></h5>
		<xsl:for-each select="correction">
			<h5><xsl:element name="a">
				<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
				<xsl:attribute name="title">Correction '<xsl:value-of select="../@titre"/>'<xsl:if test="@description"> (<xsl:value-of select="@description"/>)</xsl:if></xsl:attribute>
				Correction<xsl:if test="@description"> (<xsl:value-of select="@description"/>)</xsl:if>
			</xsl:element></h5></xsl:for-each>
	</xsl:template>
	
	<xsl:template match="reference">
		<xsl:choose>
			<xsl:when test="starts-with(@href,'#') and not(id(substring-after(@href,'#')))"><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></xsl:when>
			<xsl:otherwise><a href="{@href}"><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></a></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="puissance">
		<sup><xsl:value-of select="."/></sup>
	</xsl:template>
	
	<xsl:template match="exemplejavascript">
		<p class="javascript">
			<xsl:for-each select="node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</p>
	</xsl:template>
	<xsl:template match="declaration">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<span class="declaration">var</span>&#160;<span class="variable"><xsl:value-of select="@nomvariable"/></span>&#160;=&#160;<xsl:if test="@new='oui'"><span class="instruction">new</span>&#160;</xsl:if><span class="autres"><xsl:value-of select="@valeur"/></span>
	</xsl:template>
	<xsl:template match="bloc">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>{<br/>
		<xsl:for-each select="*"><xsl:apply-templates select="."/></xsl:for-each>
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>}<xsl:if test="@avec_retour='vrai'"><br/></xsl:if>
	</xsl:template>
	<xsl:template match="variable">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<span class="variable"><xsl:value-of select="@name"/></span>
	</xsl:template>
	<xsl:template match="propriete">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<span class="propriete"><xsl:value-of select="@name"/></span>
	</xsl:template>
	<xsl:template match="instruction">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<span class="instruction"><xsl:value-of select="@name"/></span>
	</xsl:template>
	<xsl:template match="autres">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="fonction">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<span class="fonction"><xsl:value-of select="@name"/></span>(<xsl:for-each select="node()"><xsl:apply-templates select="."/><xsl:if test="not(position()=last())">,&#160;</xsl:if></xsl:for-each>)</xsl:template>
	<xsl:template match="finligne">
		<xsl:text> </xsl:text><xsl:value-of select="@caractère"/><br />
	</xsl:template>
	<xsl:template match="sautligne">
		<br />
	</xsl:template>
	<xsl:template match="commentaire_js">
		<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="@niveau"/></xsl:call-template>
		<xsl:choose>
			<xsl:when test="sautligne"><span class="commentaire">/*<xsl:apply-templates select="node()"/>*/</span></xsl:when>
			<xsl:otherwise><span class="commentaire">//<xsl:value-of select="."/></span></xsl:otherwise>
		</xsl:choose>
		<br/>
	</xsl:template>
	
	<xsl:template match="valeur">
		<em><xsl:for-each select="node()"><xsl:value-of select="."/></xsl:for-each></em>
	</xsl:template>
	
	<xsl:template name="indentation">
		<xsl:param name="valeur"/>
		<xsl:choose>
			<xsl:when test="$valeur=0"/>
			<xsl:when test="$valeur=1">&#160;&#160;</xsl:when>
			<xsl:otherwise>&#160;&#160;<xsl:call-template name="indentation"><xsl:with-param name="valeur" select="($valeur)-1"/></xsl:call-template></xsl:otherwise>
		</xsl:choose>	
	</xsl:template>
	
</xsl:stylesheet>
