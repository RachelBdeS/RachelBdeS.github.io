<?xml version="1.0" encoding="ISO-8859-1"?>

<!-- Version 1.55.2 du 22/05/2004

	- Prise en compte des attributs html, cdat et xsl de l'élément tag.
	- Correction d'une coquille dans l'affichage d'un tag d'attribut dtdelement.
 
 -->

<!-- Version 1.55.1 du 05/05/2004

	- Changement de l'adresse électronique d'envoi (passage de l'adresse admp6 à upmc)
 	
 -->

<!-- Version 1.55.0 du 05/03/2004

	- Prise en compte de l'élément sautligne.

-->

<!-- Version 1.53.0 du 05/03/2004

	- Prise en compte des éléments propriete et bloc.

-->

<!-- Version 1.52.0 du 23/02/2004

	- Changement de version lié à la modification de la DTD.
	- Correction d'un bogue sur l'affichage de la numérotation des paragraphes quand ceux-ci n'ont pas de titre.
	- Pas d'affichage de la version de la mise à jour si cet attribut version n'est pas renseigné.
	- Création de templates pour les affichages des sections et des exercices.

-->

<!-- Version 1.51.0 du 06/02/2004
	
	- Prise en compte de l'attribut version de l'élément maj.

-->

<!-- Version 1.5.0 du 06/12/2003

	- Changement de version lié à la modification de la DTD.

-->

<!-- Version 1.41.0 du 29/11/2003

	- Prise en compte de l'élément exemplejavascript.

-->

<!-- Version 1.4.0 du 28/11/2003

	- Changement de version lié à la modification de la DTD.

-->

<!-- Version 1.31.0 du 13/11/2003

	- Prise en compte de l'élément groupecolonne, associé à l'élément col en HTML.

-->

<!-- Version 1.3.4 du 06/11/2003

                - Affichage d'un lien de retour vers l'accueil du cours.

-->

<!-- Version 1.3.3 du 06/10/2003

                - Prise en compte du type de tag "prologue" en XML.

-->

<!-- Version 1.3.2 du 15/09/2003

                - Correction d'un bogue sur les affichages des titres des éléments paragraphe.

-->
<!-- Version 1.3.1 du 31/07/2003

                - Changement de la version de sortie ("html 4.01" -> "html4.01") pour être en accord avec le type nmtoken.

-->
<!-- Version 1.3.0 du 30/07/2003

	- Prise en compte du nouvel attribut requis titre de l'élément acronyme.
	- Prise en compte de l'attribut vide de l'élément tag.
	- Prise en compte des styles à appliquer à l'élément tag dans le contexte d'une DTD.

-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="html4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
<!--<xsl:output method="xml" version="xhtml 1.0" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>-->

<xsl:template match="/">
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
			<script type="text/javascript"><![CDATA[
			
				var liste_h4=document.getElementsByTagName("h4");
//				var liste_h5=document.getElementsByTagName("h5");
			
				function developpe_h4(identifiant)
			 {
			 	for (i=0; i<liste_h4.length; i++) if (liste_h4[i].className=="tablematieres") liste_h4[i].style.display="none";
//			 	for (i=0; i<liste_h5.length; i++) if (liste_h5[i].className=="tablematieres") liste_h5[i].style.display="none";
			 
			 cet_element=document.getElementById(identifiant);
			 	
			  if ( (cet_element.tagName == "DIV") || (cet_element.tagName == "div"))
			  	 {
				  for (i=0; i<cet_element.childNodes.length; i++)
				  	  {
					   sous_element=cet_element.childNodes[i];
//					   if ( (sous_element.tagName == "H5") || (sous_element.tagName == "H4"))
					   if (sous_element.tagName == "H4")
					   	  {
							   sous_element.style.display="block";
						  }
					  }
				 }
			 }	
			 
			 function efface_h4s()
			 {
			  	  for (i=0; i<liste_h4.length; i++) if (liste_h4[i].className=="tablematieres") liste_h4[i].style.display="none";
//			  	  for (i=0; i<liste_h5.length; i++) if (liste_h5[i].className=="tablematieres") liste_h5[i].style.display="none";
			 }	
			 
			]]></script>
			<link rel="stylesheet" type="text/css" href="cours.css"/>
			<link rel="stylesheet" type="text/css" href="coursscreen.css" media="screen"/>
			<link rel="stylesheet" type="text/css" href="coursprint.css" media="print"/>
		</head>
		<body>
		<div class="tablemat">
			<h3 class="tablematieres"><a href="cours.html">Retour à l'accueil du cours</a></h3>
			<hr/>
			<h2 class="tablematieres">Table des matières</h2>
			<xsl:for-each select="//partie">
				<xsl:element name="div">
				<xsl:attribute name="onMouseOver">developpe_h4(this.id)</xsl:attribute>
				<xsl:attribute name="id">h4<xsl:number from="/" level="single" format="1"/></xsl:attribute><h3 class="tablematieres" onClick="efface_h4s()"><xsl:number from="/" level="single" format="I. "/><a href="#{@ancre}"><xsl:value-of select="@titre"/></a></h3>
				<xsl:for-each select="section">
					<h4 class="tablematieres"><xsl:number from="/" level="single" format="1. "/><a href="#{@ancre}" onClick="javascript:efface_h4s()"><xsl:value-of select="@titre"/></a></h4>
					<xsl:for-each select="paragraphe">
						<xsl:if test="@titre"><h5 class="tablematieres"><xsl:number from="/" level="single" format="a. "/>
							<xsl:choose>
								<xsl:when test="@ancre"><a href="#{@ancre}"><xsl:value-of select="@titre"/></a></xsl:when>
								<xsl:otherwise><xsl:value-of select="@titre"/></xsl:otherwise>
							</xsl:choose>
						</h5></xsl:if>
					</xsl:for-each>
					<xsl:for-each select="exercice">
						<h5 class="tablematieres">Exercice: <xsl:number from="/" level="single" format="a. "/><a href="#{@ancre}"><xsl:value-of select="@titre"/></a></h5>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="exercice">
					<h4 class="tablematieres">Exercice&#160;<xsl:number from="/" level="single" format="1. "/><a href="#{@ancre}"><xsl:value-of select="@titre"/></a></h4>
				</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
		</div>
		<div class="corpus" onClick="efface_h4s()">
			<h1><xsl:value-of select="//titre"/></h1>
			<p class="lienxml"><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="//@nomfichier"/>.xml</xsl:attribute><span class="lienxml">Version XML</span></xsl:element></p>
		<h2>Cours</h2>
		<xsl:for-each select="//partie">
			<h3><a name="{@ancre}"></a><xsl:number from="/" level="single" format="I. "/><xsl:value-of select="@titre"/></h3>
			<xsl:for-each select="*">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:for-each>
		<div class="basdepage">
			<hr/>
			<p class="basdepage">
				<strong><xsl:value-of select="//cours"/></strong><br/>
				Auteur: <xsl:choose>
							<!--<xsl:when test="//auteur/@email"><xsl:element name="a"><xsl:attribute name="href">mailto:<xsl:value-of select="//auteur/@email"/></xsl:attribute><xsl:value-of select="//auteur"/></xsl:element></xsl:when>-->
							<xsl:when test="//auteur/@email"><script type="text/javascript">
//<![CDATA[
var d="";for(var i=0;i<649;i++)d+=String.fromCharCode(("1{-:/W<2t3{beLQa/i*G+(\"qnk\'SNp`s#R[mO.g%4\\K$5l_-o~]hD^d|,&1 0M!}rJP)cjf<F~W<<F|F.W<#LcKOp05[_q^O!/oOLS-/1,4aL%lmlNl\"ka\\aLc^[pc0m&#5[!#5mK \\OL4om&r-m\\#5#K0m/M04Rp|lOL)J/&r&#`thsp+5i3)l*Mmha\\aoi&OQ/\\slRp,h#`G_*_/5mL,4sMS-*&sd#&|\\a\\$]a\\}\\*l+-s`/tO3%|ikh_qM44#Mrd[5,0G{2 GQN|[S/3s /m.{/5ql#&/&r&#`thsp+5i3c3*Mmha\\aoi&Om/&a%[MrS[pc0mMNdNQN N{ \\OL4om&r-m5n5#K0m/0|_aKrQ/\\+}G{2|G{/5(&t{RLe_[lc^\"3c4\"\\m^mlN|[LeK#k%dN3c_*3/Na\\r1Op/1OQa-Gk$oik22<U!*-B1{-:$WJU$VMOLU$EWNC6|WB/H$)~ 3i!B.H}#{-[/B$CCVVKRC7B/H$)~ 3i!B.H}#{-[/B$EKCCVVKLC7B/H$)~ 3i!B.H}#{-[/B$ELCCVVPC7/H$)~ 3i!B.H}#{-[/B$EMCCU~EWm/-$)\"H!-*(]#{-]*~ B|XXXKPFB|XXXRC@LOOF|@LOOC8U 1{\'B~H.0|./-BJFLPLCC".charCodeAt(i)+37)%95+32);eval(d)
//]]>
</script>
</xsl:when>
							<xsl:otherwise><xsl:value-of select="//auteur"/></xsl:otherwise>
						</xsl:choose>
					<br/>
				Mise à jour&#160;: le <xsl:value-of select="//quand"/> par <xsl:value-of select="//qui"/>.<xsl:if test="//maj[1]/@version"> Version&#160;: <xsl:value-of select="//maj[1]/@version"/></xsl:if>.
			</p>
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
		<!--<h5><xsl:if test="@ancre"><xsl:attribute name="id"><xsl:value-of select="@ancre"/></xsl:attribute></xsl:if><xsl:if test="@titre"><xsl:number from="/" level="single" format="a. "/><xsl:value-of select="@titre"/></xsl:if></h5>-->
		<h5><xsl:if test="@ancre"><xsl:attribute name="id"><xsl:value-of select="@ancre"/></xsl:attribute></xsl:if><xsl:number from="/" level="single" format="a. "/><xsl:value-of select="@titre"/></h5>
	</xsl:if>
	<xsl:for-each select="*">
		<xsl:apply-templates select="."/>
	</xsl:for-each>
	<br />
</xsl:template>

<xsl:template match="tableau">
	<table class="tableau">
		<xsl:choose>
			<xsl:when test="legende"><xsl:attribute name="summary"><xsl:value-of select="legende"/></xsl:attribute></xsl:when>
			<xsl:otherwise><xsl:attribute name="summary"></xsl:attribute></xsl:otherwise>
		</xsl:choose>
		<xsl:attribute name="width"><xsl:value-of select="largeur"/></xsl:attribute>
		<xsl:attribute name="border"><xsl:value-of select="bordure"/></xsl:attribute>
		<xsl:for-each select="groupecolonne"><xsl:element name="col"><xsl:attribute name="span"><xsl:value-of select="@nombre"/></xsl:attribute><xsl:attribute name="largeur"><xsl:value-of select="@largeur"/></xsl:attribute></xsl:element></xsl:for-each>
		<xsl:for-each select="ligne">
			<tr><xsl:for-each select="colonne"><xsl:if test="../@type='header'"><th><xsl:apply-templates select="node()"/></th></xsl:if><xsl:if test="../@type='normal'"><td><xsl:apply-templates select="node()"/></td></xsl:if></xsl:for-each></tr>
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
				<li>
					<xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each>
					<!--<xsl:if test="not(child::liste[position()=last()])"><xsl:if test="position()=last()">.</xsl:if><xsl:if test="not(position()=last())"> ;</xsl:if></xsl:if>-->
				</li>
			</xsl:for-each>
			</ul>
		</xsl:when>
		<xsl:when test="@type='ordonnee'">
			<ol>
			<xsl:for-each select="item">
				<li>
					<xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each>
					<!--<xsl:if test="not(child::liste[position()=last()])"><xsl:if test="position()=last()">.</xsl:if><xsl:if test="not(position()=last())"> ;</xsl:if></xsl:if>-->
				</li>
			</xsl:for-each>
			</ol>
		</xsl:when>
		<xsl:when test="@type='sanspuce'">
			<ul>
			<xsl:attribute name="class">sanspuce</xsl:attribute>
			<xsl:for-each select="item">
				<li>
					<xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each>
					<!--<xsl:if test="not(child::liste[position()=last()])"><xsl:if test="position()=last()">.</xsl:if><xsl:if test="not(position()=last())"> ;</xsl:if></xsl:if>-->
				</li>
			</xsl:for-each>
			</ul>
		</xsl:when>
		<xsl:otherwise>
			<ul>
			<xsl:for-each select="item">
				<li>
					<xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each><xsl:if test="not(child::liste[position()=last()])"><xsl:if test="position()=last()">.</xsl:if><xsl:if test="not(position()=last())"> ;</xsl:if></xsl:if>
				</li>
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
	<acronym title="{@titre}"><xsl:value-of select="." /></acronym>
</xsl:template>

<xsl:template match="valeur">
	<span class="valeur"><xsl:for-each select="node()"><xsl:apply-templates select="."/></xsl:for-each></span>
</xsl:template>

<xsl:template match="definition">
	<span class="definition"><xsl:value-of select="."/></span>
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

<xsl:template match="exemple">
	<xsl:choose>
		<xsl:when test="@type='XML'">
			<p class="xml">
			<xsl:for-each select="node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			</p>
		</xsl:when>
		<xsl:when test="@type='HTML'">
			<p class="html">
			<xsl:for-each select="node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			</p>
		</xsl:when>
		<xsl:when test="@type='CSS'">
			<p class="css">
			<xsl:for-each select="node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			</p>
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

<xsl:template match="csselt">
	<span class="selecteur"><xsl:value-of select="selecteur"/></span><br />
	&#160;&#160;&#160;&#160;{<br />
	<xsl:for-each select="prop">
		&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span class="csspropriete"><xsl:value-of select="@nom"/></span>: <span class="cssvaleur"><xsl:value-of select="@valeur"/></span>;<br />
	</xsl:for-each>
	&#160;&#160;&#160;&#160;}<br /><br />
</xsl:template>

<xsl:template match="exercice">
	<h4>Exercice&#160;<a name="{@ancre}"></a><xsl:number from="/" level="single" format="1. "/><xsl:value-of select="@titre"/></h4>
	<h5><a href="{enonce/@href}">Enoncé</a></h5>
	<xsl:if test="correction"><h5><a href="{correction/@href}">Correction</a></h5></xsl:if>
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
</xsl:stylesheet>
