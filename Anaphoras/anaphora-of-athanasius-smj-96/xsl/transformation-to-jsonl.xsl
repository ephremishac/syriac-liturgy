<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output encoding="UTF-8" indent="no" media-type="text/json" method="text" use-character-maps="remove-brackets"/>
    
    <xsl:character-map name="remove-brackets">
        <xsl:output-character character="[" string=""/>
        <xsl:output-character character="]" string=""/>
    </xsl:character-map>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:seg[@type = 'liturgical-section'][not(exists(@prev))]"/>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'liturgical-section'][not(exists(@prev))]">
        <xsl:text>{</xsl:text>
        <xsl:text>"section_id" : "</xsl:text>
        <xsl:value-of select="@xml:id"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"title_of_section" : "</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"document_title" : "</xsl:text>
        <xsl:value-of select="root()/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[1]/text()"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"language" : "</xsl:text>
        <xsl:value-of select="ancestor::tei:div[@type = 'transcription']/@xml:lang"/>
        <xsl:text>",</xsl:text>
        <xsl:text>"text_of_section" : "</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:if test="exists(@next)">
            <xsl:variable name="next-segment" select="substring-after(@next,'#')"/>
            <xsl:apply-templates select="root()//tei:seg[@type = 'liturgical-section'][@xml:id = $next-segment]"/>
        </xsl:if>
        <xsl:text>",</xsl:text>
        <xsl:text>"document_url" : "</xsl:text>
        <xsl:text>./anaphoras/anaphora-of-athanasius-of-alexandrien-smmj-96.html</xsl:text>
        <xsl:text>"</xsl:text>
        <xsl:text>}
</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'liturgical-section'][exists(@prev)][not(exists(@rend))]">
        <xsl:apply-templates select="child::node()"/>
        <xsl:if test="exists(@next)">
            <xsl:variable name="next-segment" select="substring-after(@next,'#')"/>
            <xsl:apply-templates select="root()//tei:seg[@type = 'liturgical-section'][@xml:id = $next-segment]"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:pb"/>
    
    <xsl:template match="tei:lb">
        <xsl:if test="@n != '1'">
            <xsl:value-of select="' '"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'emphasized']">
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'rubric']">
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:choose>
            <xsl:when test=". = '
                '"><xsl:value-of select="''"/></xsl:when>
            <xsl:when test=". = '
               '"><xsl:value-of select="' '"/></xsl:when>
            <xsl:when test="starts-with(.,' ') and parent::tei:p"><xsl:value-of select="."/></xsl:when>
            <xsl:when test="ends-with(.,' ') and parent::tei:p"><xsl:value-of select="."/></xsl:when>
            <xsl:otherwise><xsl:value-of select="normalize-space(.)"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>