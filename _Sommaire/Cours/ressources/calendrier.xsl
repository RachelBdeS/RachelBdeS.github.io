<?xml version="1.0" encoding="UTF-8"?>
<!-- Version 1.01 du 24 avril 2007
	- Simplification du code
-->
<!-- Version 1.0 du 28 octobre 2005
	- Création
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template name="cal_dateSchemaVersDateCalendrier">
		<xsl:param name="date"/><!-- au format YYYY-MM-DD -->
		<!-- Détermination du quantième -->
		<xsl:variable name="i_jour" select="number(substring($date, 9, 2))"/>
		<!-- Détermination du mois -->
		<xsl:variable name="i_mois" select="number(substring($date, 6, 2))"/>
		<!-- Détermination de l'année -->
		<xsl:variable name="i_an" select="number(substring-before($date, '-'))"/>
		<xsl:value-of select="$i_jour"/><xsl:if test="$i_jour=1">er</xsl:if>
		<xsl:choose>
			<xsl:when test="$i_mois=1"><xsl:value-of select="concat(' janvier ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=2"><xsl:value-of select="concat(' février ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=3"><xsl:value-of select="concat(' mars ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=4"><xsl:value-of select="concat(' avril ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=5"><xsl:value-of select="concat(' mai ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=6"><xsl:value-of select="concat(' juin ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=7"><xsl:value-of select="concat(' juillet ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=8"><xsl:value-of select="concat(' août ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=9"><xsl:value-of select="concat(' septembre ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=10"><xsl:value-of select="concat(' octobre ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=11"><xsl:value-of select="concat(' novembre ', $i_an)"/></xsl:when>
			<xsl:when test="$i_mois=12"><xsl:value-of select="concat(' décembre ', $i_an)"/></xsl:when>
			<xsl:otherwise>--Erreur de date--</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
</xsl:stylesheet>
