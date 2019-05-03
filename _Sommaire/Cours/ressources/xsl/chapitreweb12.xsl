<?xml version="1.0" encoding="ISO-8859-1" ?>
<!-- Version 1.21 du 14/07/2005
 	- Prise en compte des nouveaux �l�ments de d�claration d'�l�ments et d'attributs (accord avec la DTD 2.01).
 -->
<!-- Version 1.2 du 08/07/2005
 	- Changement de l'affichage des �l�ments dans les exemples (accord avec la DTD 2.0).
 -->
<!-- Version 1.17 du 03/06/2005
	- Ajout d'un test de pr�sence des bordure et largeur dans les tableaux.
	- Changement de <p class="legende"> en <caption> pour les tableaux.
	- Explicitation des liens vers les �nonc�s et corrections d'exercices (utilisation de l'attribut title)
	- Suppression de la gestion de l'attribut largeur dans les tableaux.
	- Ajout de la description des corrections si besoin est.
-->
<!-- Version 1.16 du 29/04/2005
	- Correction du lien vers la table des mati�res dans la balise <link rel="contents"...>
-->
<!-- Version 1.15 du 19/04/2005
 	- Ajout d'un sujet automatique dans l'envoi du courriel.
 -->
<!-- Version 1.14 du 04/02/2005
 	- Ajout du copyright pour 2005; correction d'un doublon pour la d�claration du template "exercice".
-->
<!-- Version 1.13 du 02/02/2005
 	- Modification de l'xsl:output (il manquait l'URI de la DTD de HTML).
 -->
<!-- Version 1.12 du 01/12/2004
	- Affichage de la "description" des corrections d'exercices.
 	- Ajouts d'espaces ins�cables dans le fichier de sortie;
 	- Correction d'une erreur dans le nom de la feuille de style li�e (doit d�pendre de la variable destination).
 -->
<!-- Version 1.11 du 29/11/2004
 	- Prise en compte de l'�l�ment "espace ins�cable" <espace>.
 	- Prise en compte de l'�l�ment logiciel.
 -->
<!-- Version 1.1 du 17/10/2004
 	- Permet de s�lectionner si la sortie est destin�e au cours en ligne ou au web.
 -->
<!-- Version 1.05 du 06/10/2004
 	- Ajout des termes de copyright.
 -->
<!-- Version 1.04 du 28/06/2004
 	- Prise en compte de l'�l�ment remarque, enfant de l'�l�ment exercice.
 -->
<!-- Version 1.03 du 23/06/2004
	- Ajout des balises link rel=last, first, contents, up dans l'ent�te.
 -->
<!-- Version 1.02 du 16/06/2004
	- Affichage des corrections des exercices.
	- Correction d'un bogue dans la table des mati�res pour les paragraphes sans titre.
 -->
<!-- Version 1.01 du 25/05/2004
	- Correction d'un bogue: v�rification si la partie contient au moins une section ou un exercice, pour la cr�ation d'une liste ol (sinon, cr�ait <ol></ol>, ce qui �tait fautif). 
 -->
<!-- Version 1.0 du 24/05/2004
	- Cr�ation.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	<xsl:template match="/">
                <!--valeurs possibles: siteweb pour le site sur Free; coursenligne pour le... cours en ligne � l'UPMC -->
                        <xsl:variable name="destination" select="'siteweb'"/>
		<xsl:variable name="nomfic" select="//cours/@nomfichier"/>
		<html lang="fr">
		<head>
			<title><xsl:value-of select="//titre"/></title>
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
			<xsl:if test="document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]"><link rel="next" href="{concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.html')}"/></xsl:if>
			<xsl:if test="document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]"><link rel="prev" href="{concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.html')}"/></xsl:if>
			<link rel="contents" href="toc.html" type="text/html"/>
			<link rel="up" href="index.html" type="text/html"/>
			<link rel="first" href="{concat(document('cours.xml')/cours/plan/chapitre[1]/@href, '.html')}" type="text/html"/>
			<link rel="last" href="{concat(document('cours.xml')/cours/plan/chapitre[last()]/@href, '.html')}" type="text/html"/>
			<xsl:choose>
			    <xsl:when test="$destination='siteweb'">
			        <xsl:variable name="feuille" select="'forme1'"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, '.css')}"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'screen.css')}" media="screen"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'print.css')}" media="print"/>
			    </xsl:when>  
			    <xsl:when test="$destination='coursenligne'">
			        <xsl:variable name="feuille" select="'forme2'"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, '.css')}"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'screen.css')}" media="screen"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'print.css')}" media="print"/>
			    </xsl:when>  
			    <xsl:otherwise>
			        <xsl:variable name="feuille" select="'forme1'"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, '.css')}"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'screen.css')}" media="screen"/>
			        <link rel="stylesheet" type="text/css" href="{concat($feuille, 'print.css')}" media="print"/>
			    </xsl:otherwise>
			</xsl:choose>
		</head>
		<body>
			<div id="entete">
				<h1><xsl:value-of select="//titre"/></h1>
				<p>Derni�re <a href="#listemaj">mise � jour</a> le <xsl:value-of select="//maj[1]/quand"/>.</p>
			</div>
			<div id="tablemat">
				<p><a href="index.html">Accueil du cours</a></p>
				<hr/>
				<ol>
					<xsl:for-each select="//partie">
						<li><h3 class="tablematieres"><a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a></h3>
							<xsl:if test="section | exercice"><ol>
								<xsl:for-each select="section | exercice">
									<xsl:choose>
										<xsl:when test="local-name(.)='section'">
											<li><h4 class="tablematieres"><a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a></h4>
												<xsl:if test="paragraphe/@titre | exercice"><ol><xsl:for-each select="paragraphe | exercice">
													<xsl:choose>
														<xsl:when test="local-name(.)='paragraphe'">
															<xsl:if test="@titre"><li><h5 class="tablematieres"><xsl:choose><xsl:when test="@ancre"><a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a></xsl:when><xsl:otherwise><xsl:value-of select="@titre"/></xsl:otherwise></xsl:choose></h5></li></xsl:if>
														</xsl:when>
														<xsl:otherwise>
															<li><h5 class="tablematieres">Ex.<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="#{@ancre}" title="{@titre}"><xsl:value-of select="@titre"/></a></h5></li>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
												</ol></xsl:if>
											</li>
										</xsl:when>
										<xsl:otherwise>
											<li><h4 class="tablematieres">Ex.<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <xsl:number from="/" level="single" format="1. "/><a href="#{@ancre}"><xsl:value-of select="@titre"/></a></h4></li>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</ol></xsl:if>
						</li>
					</xsl:for-each>
				</ol>
			    <xsl:choose>
			        <xsl:when test="$destination='siteweb'">
				<hr />
			            <p>Auteur<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="mailto:Gilles.Chagnon@free.fr?subject=[{chapitre/cours}] "><xsl:value-of select="//auteur"/></a></p>
			            <hr/>
					<!--DEBUT GOLD WEBORAMA-->
					<script type="text/javascript">
						//<![CDATA[
							WEBO_ZONE=]]><xsl:value-of select="document('weborama.xml')/zone/@numero"/><![CDATA[; 
							WEBO_PAGE=]]><xsl:value-of select="document('weborama.xml')/zone/page[@href=$nomfic]/@numero"/><![CDATA[; 
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
			        	<p>Auteur<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="mailto:Gilles.Chagnon@upmc.fr?subject=[{chapitre/cours}] "><xsl:value-of select="//auteur"/></a></p>
			        </xsl:when>
			        <xsl:otherwise>
			            <hr />
			        	<p>Auteur<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="mailto:Gilles.Chagnon@free.fr?subject=[{chapitre/cours}] "><xsl:value-of select="//auteur"/></a></p>
			        </xsl:otherwise>
			    </xsl:choose>
			</div>
			<div id="main">
				<div id="navigation1">
				    <p>Copyright (c) 2004-2005 Gilles Chagnon, selon les termes de la <a href="license.html">Licence de Documentation Libre GNU</a>.</p>
					<p><xsl:if test="document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]">Cours pr�c�dent<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="{concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.html')}"><xsl:value-of select="document(concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.xml'))//titre"/></a><br/></xsl:if>
					<xsl:if test="document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]">Cours suivant<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="{concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.html')}"><xsl:value-of select="document(concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.xml'))//titre"/></a></xsl:if></p>
				</div>
				<div id="corpus">
					<xsl:for-each select="//partie">
						<h3><a name="{@ancre}"></a><xsl:number from="/" level="single" format="I. "/><xsl:value-of select="@titre"/></h3>
						<xsl:for-each select="*">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:for-each>
				</div>
				<div id="navigation2">
				    <p>Copyright (c) 2004-2005 Gilles Chagnon. Tous les documents li�s sont publi�s selon les termes de la <a href="license.html">Licence de Documentation Libre GNU</a>.</p>
					<p><xsl:if test="document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]">Cours pr�c�dent<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="{concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.html')}"><xsl:value-of select="document(concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/preceding-sibling::*[1]/@href,'.xml'))//titre"/></a><br/></xsl:if>
					<xsl:if test="document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]">Cours suivant<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <a href="{concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.html')}"><xsl:value-of select="document(concat(document('cours.xml')/cours/plan/chapitre[@href=$nomfic]/following-sibling::*[1]/@href,'.xml'))//titre"/></a></xsl:if></p>
					<dl id="listefichiers">
						<dt>Liste des fichiers associ�s � ce fichier HTML<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>:</dt>
						<dd><a href="{concat(//cours/@nomfichier, '.xml')}">Fichier XML</a></dd>
						<dd><a href="chapitre20.dtd">DTD du cours</a></dd>
						<dd><a href="chapitreweb12.xsl">Feuille de style XSL</a></dd>
						<xsl:choose>
			    				<xsl:when test="$destination='siteweb'">
			        					<dd><a href="forme1.css">Feuille de style CSS</a></dd>
							</xsl:when>  
							<xsl:when test="$destination='coursenligne'">
								<dd><a href="forme2.css">Feuille de style CSS</a></dd>
							</xsl:when>  
							<xsl:otherwise>
								<dd><a href="forme1.css">Feuille de style CSS</a></dd>
							</xsl:otherwise>
						</xsl:choose>
						
					</dl>
				</div>
				<div id="maj">
					<a name="listemaj"></a><h4>Historique de ce document</h4>
					<dl>
					<xsl:for-each select="//maj">
						<dt>Le <xsl:value-of select="quand"/>, par <xsl:value-of select="qui"/> (v. <xsl:value-of select="@version"/>)<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>:</dt>
						<dd><xsl:value-of select="quoi"/></dd>
					</xsl:for-each>
					</dl>
				</div>
			</div>
		</body>
	</html>
	</xsl:template>
	
<xsl:template match="section">
	<h4><a name="{@ancre}"></a><xsl:number from="/" level="single" format="1. "/><xsl:value-of select="@titre"/></h4>
	<xsl:for-each select="*">
		<xsl:apply-templates select="."/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="paragraphe">
	<xsl:if test="@titre">
		<h5><xsl:if test="@ancre"><xsl:attribute name="id"><xsl:value-of select="@ancre"/></xsl:attribute></xsl:if><xsl:number from="/" level="single" format="a. "/><xsl:value-of select="@titre"/></h5>
	</xsl:if>
	<xsl:for-each select="*">
		<xsl:apply-templates select="."/>
	</xsl:for-each>
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
				<xsl:if test="../@type='normal'"><td headers="{@headers}"><xsl:apply-templates select="node()"/></td></xsl:if>
			</xsl:for-each></tr>
		</xsl:for-each>
	</table>
	<p class="legende">Table&#160;<xsl:number from="/" level="any" format="1. "/>
	<xsl:if test="legende"><xsl:apply-templates select="legende"/></xsl:if>
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

<xsl:template match="image">
	<span class="image"><xsl:element name="img">
		<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
		<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
		<xsl:attribute name="width"><xsl:value-of select="@largeur"/></xsl:attribute>
		<xsl:attribute name="height"><xsl:value-of select="@hauteur"/></xsl:attribute>
		<xsl:attribute name="class"><xsl:value-of select="@classe"/></xsl:attribute>
	</xsl:element>
	</span>
	<xsl:if test="legende"><caption><xsl:apply-templates select="legende"/></caption></xsl:if>
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

<xsl:template match="tag">
	<xsl:choose>
			<xsl:when test="@niveau='1'">&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='2'">&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='3'">&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='4'">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='5'">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
		<xsl:when test="@type='prologue'"><span class="enteteexemplexml">&lt;?<xsl:value-of select="."/>?&gt;</span><br/></xsl:when>
		<xsl:when test="@type='general'"><span class="tag">&lt;<xsl:value-of select="."/><xsl:if test="@vide='yes'">/</xsl:if>&gt;</span><xsl:if test="@pos='fin'"><br/></xsl:if></xsl:when>
		<xsl:when test="@type='html'"><span class="exemplehtml">&lt;<xsl:value-of select="."/><xsl:if test="@vide='yes'">/</xsl:if>&gt;</span><xsl:if test="@pos='fin'"><br/></xsl:if></xsl:when>
		<xsl:when test="@type='cdat'"><span class="exemplecdata">&lt;<xsl:value-of select="."/><xsl:if test="@vide='yes'">/</xsl:if>&gt;</span><xsl:if test="@pos='fin'"><br/></xsl:if></xsl:when>
		<xsl:when test="@type='commentaire'"><span class="commentaire">&lt;!--&#160;<xsl:value-of select="."/>&#160;--&gt;</span><br/></xsl:when>
		<xsl:when test="@type='doctype'"><span class="doctype">&lt;!<xsl:value-of select="."/>&#160;&gt;</span><br/></xsl:when>
		<xsl:when test="@type='dtdexterne'"><span class="exempledtdexterne">&lt;!<xsl:value-of select="."/>&gt;</span><br/></xsl:when>
		<xsl:when test="@type='dtdinterne'"><span class="exempledtdinterne">&lt;!<xsl:value-of select="."/>[</span><br/></xsl:when>
		<xsl:when test="@type='dtdinternefin'"><span class="exempledtdinterne">]&gt;</span><br/></xsl:when>
		<xsl:when test="@type='dtdelement'"><span class="exempledtdelement">&lt;!<xsl:value-of select="."/>&gt;</span><br/></xsl:when>
		<xsl:when test="@type='dtdattribut'"><span class="exempledtdattribut">&lt;!<xsl:value-of select="."/></span><br/></xsl:when>
		<xsl:when test="@type='dtdattributmilieu'"><span class="exempledtdattribut"><xsl:value-of select="."/></span><br/></xsl:when>
		<xsl:when test="@type='dtdattributfin'"><span class="exempledtdattribut"><xsl:value-of select="."/>&gt;</span><br/></xsl:when>
		<xsl:when test="@type='xsl'"><span class="exemplexsl">&lt;<xsl:value-of select="."/><xsl:if test="@vide='yes'">/</xsl:if>&gt;</span><xsl:if test="@pos='fin'"><br/></xsl:if></xsl:when>
		<xsl:otherwise>&lt;<span class="tag"><xsl:value-of select="."/></span><xsl:if test="@vide='yes'">/</xsl:if>&gt;<xsl:if test="@pos='fin'"><br/></xsl:if></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="contenu">
	<xsl:choose>
			<xsl:when test="@niveau='1'">&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='2'">&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='3'">&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='4'">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:when test="@niveau='5'">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
			<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
	<span class="contenu"><xsl:value-of select="."/></span><xsl:if test="@pos='fin'"><br/></xsl:if>
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
	<span class="exempledtdexterne">&lt;!DOCTYPE <xsl:value-of select="@nomracine"/>&#160;<xsl:value-of select="@type"/><xsl:if test="@identifiant">&#160;"<span class="valeurattribut"><xsl:value-of select="@identifiant"/></span>"</xsl:if>&#160;"<span class="valeurattribut"><xsl:value-of select="@href"/></span>"&gt;<br/></span>
</xsl:template>
	
<xsl:template match="typedocument_interne">
	<span class="exempledtdinterne">&lt;!DOCTYPE <xsl:value-of select="@nomracine"/>[</span><br/><xsl:apply-templates /><span class="exempledtdinterne">]&gt;</span>
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
	
<xsl:template match="attribut">&#160;<span class="nomattribut"><xsl:value-of select="@nom"/></span><xsl:if test="@pseudo='non'">="<span class="valeurattribut"><xsl:value-of select="."/></span>"</xsl:if></xsl:template>
	
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
	<span class="exempledtdelement">&lt;!ENTITY</span><xsl:if test="@type='param�trique'">&#160;%</xsl:if>&#160;<span class="tag"><xsl:value-of select="@nom"/></span><xsl:choose><xsl:when test="@syspub='system'">&#160;SYSTEM</xsl:when><xsl:when test="@syspub='public'">&#160;PUBLIC</xsl:when></xsl:choose>&#160;<span class="valeurattribut">"<xsl:value-of select="@valeur"/>"</span><xsl:if test="@identifiant">&#160;"<xsl:value-of select="@identifiant"/>"</xsl:if><span class="dtdelement">&gt;</span><br/>
</xsl:template>

<xsl:template match="csselt">
	<span class="selecteur"><xsl:value-of select="selecteur"/></span><br />
	&#160;&#160;&#160;&#160;{<br />
	<xsl:for-each select="prop">
		&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span class="csspropriete"><xsl:value-of select="@nom"/></span><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>: <span class="cssvaleur"><xsl:value-of select="@valeur"/></span>;<br />
	</xsl:for-each>
	&#160;&#160;&#160;&#160;}<br /><br />
</xsl:template>

<xsl:template match="exercice">
	<h4>Exercice&#160;<a name="{@ancre}"></a><xsl:number from="/" level="single" format="1. "/><xsl:value-of select="@titre"/></h4>
	<xsl:if test="remarque"><p><xsl:value-of select="remarque"/></p></xsl:if>
	<h5><a href="{enonce/@href}" title="Enonc� de l'exercice '{@titre}'">Enonc�</a></h5>
	<xsl:for-each select="correction">
	<h5><xsl:element name="a">
		<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
		<xsl:attribute name="title">Correction '<xsl:value-of select="../@titre"/>'<xsl:if test="@description"> (<xsl:value-of select="@description"/>)</xsl:if></xsl:attribute>
		Correction<xsl:if test="@description"> (<xsl:value-of select="@description"/>)</xsl:if>
	</xsl:element></h5></xsl:for-each>
</xsl:template>

<xsl:template match="reference">
	<a href="{@href}"><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></a>
</xsl:template>

<xsl:template match="exemplejavascript">
	<p class="javascript">
		<xsl:for-each select="node()">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</p>
</xsl:template>
<xsl:template match="declaration">
	<span class="declaration">var</span>&#160;<span class="variable"><xsl:value-of select="@nomvariable"/></span>&#160;=&#160;<span class="instruction">new</span>&#160;<span class="autres"><xsl:value-of select="@valeur"/></span>
</xsl:template>
<xsl:template match="bloc">
	{<br/>
	<xsl:for-each select="*"><xsl:apply-templates select="."/></xsl:for-each>
	}<br/>
</xsl:template>
<xsl:template match="variable">
	<span class="variable"><xsl:value-of select="@name"/></span>
</xsl:template>
<xsl:template match="propriete">
	<span class="propriete"><xsl:value-of select="@name"/></span>
</xsl:template>
<xsl:template match="instruction">
	<span class="instruction"><xsl:value-of select="@name"/></span>
</xsl:template>
<xsl:template match="autres">
	<xsl:value-of select="."/>
</xsl:template>
<xsl:template match="fonction">
	<span class="fonction"><xsl:value-of select="@name"/></span>(<xsl:for-each select="node()"><xsl:apply-templates select="."/><xsl:if test="not(position()=last())">,&#160;</xsl:if></xsl:for-each>)</xsl:template>
<xsl:template match="finligne">
	;<br />
</xsl:template>
<xsl:template match="sautligne">
	<br />
</xsl:template>
	
<xsl:template match="valeur">
	<em><xsl:for-each select="node()"><xsl:value-of select="."/></xsl:for-each></em>
</xsl:template>
	
<xsl:template match="espace">
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
</xsl:template>
	
<xsl:template name="indentation">
	<xsl:param name="valeur"/>
	<xsl:choose>
		<xsl:when test="$valeur='1'">&#160;&#160;</xsl:when>
		<xsl:when test="$valeur='2'">&#160;&#160;&#160;&#160;</xsl:when>
		<xsl:when test="$valeur='3'">&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
		<xsl:when test="$valeur='4'">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
		<xsl:when test="@niveau='5'">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
		<xsl:otherwise></xsl:otherwise>
	</xsl:choose>	
</xsl:template>

</xsl:stylesheet>
