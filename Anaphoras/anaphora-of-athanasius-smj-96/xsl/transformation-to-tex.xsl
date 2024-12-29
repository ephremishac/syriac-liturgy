<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output encoding="UTF-8" method="text"/>
    
    <xsl:template match="tei:TEI">
        <xsl:text>\documentclass[11pt,a4paper]{article}
        \usepackage{polyglossia}
        %\usepackage{fontspec,xltxtra}
        \usepackage{paralist}
        \usepackage{xecolor}
        \usepackage{hyperref}
        \hypersetup{pdftex,colorlinks=true}
        \usepackage{hypcap}
        \usepackage{morefloats}
        \setmainlanguage{english}
        \setotherlanguages{syriac}
        \newfontfamily\syriacfont[Script=Syriac,Scale=1.5,ExternalLocation="./melthofonts/"]{SertoAntochBible_2020_Release.ttf}
        \parindent0pt
        \usepackage{bidi}
        \begin{document}
        \begin{center}</xsl:text>
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
        <xsl:text>\end{center}</xsl:text>
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
        <xsl:apply-templates select="tei:text/tei:body/tei:div[@type = 'transcription']"/>
        <xsl:text>\end{document}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt">
        <xsl:text>\pdfbookmark[0]{Title}{title}</xsl:text>
        <xsl:text>\Large\textbf{</xsl:text>
            <xsl:value-of select="./tei:title[not(exists(@type))]"/>
        <xsl:text>}\normalsize\par\vspace{5mm}</xsl:text>
        <xsl:value-of select="./tei:title[exists(@type)]"/>
        <xsl:text>\par\vspace{10mm}</xsl:text>
        <xsl:for-each select="./tei:respStmt">
            <xsl:text>\normalsize </xsl:text>
            <xsl:value-of select="./tei:resp/text()"/>
            <xsl:text>\par\vspace{5mm}\large </xsl:text>
            <xsl:value-of select="./tei:persName"/>
            <xsl:if test="position() != last()">
                <xsl:text>\par\vspace{7mm}</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>\normalsize\par\vspace{10mm}</xsl:text>
        <xsl:value-of select="./tei:respStmt/tei:note[@type = 'project-number']/text()"/>
        <xsl:text>\par\vspace{2mm}</xsl:text>
        <xsl:value-of select="./tei:respStmt/tei:note[@type = 'project-name']/text()"/>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt">
        <xsl:text>\pdfbookmark[0]{Publication Statement}{publication}</xsl:text>
        <xsl:text>Publisher: \textit{</xsl:text>
            <xsl:value-of select="./tei:publisher"/>
        <xsl:text>}\par</xsl:text>
        <xsl:text> Licence: \textit{</xsl:text>
            <xsl:value-of select="./tei:availability/tei:licence"/>
        <xsl:text>}\par</xsl:text>
        <xsl:text> Date of publication: \textit{</xsl:text>
            <xsl:value-of select="./tei:date"/>
        <xsl:text>}\par\vspace{5mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc">
        <xsl:text>\pdfbookmark[0]{Manuscript}{0}</xsl:text>
        <xsl:text>Manuscript:</xsl:text>
        <xsl:text>\begin{compactitem}</xsl:text>
        <xsl:text>\item Settlement: </xsl:text>
        <xsl:text>\textit{</xsl:text>
            <xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:settlement/text()"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\item Repository: </xsl:text>
        <xsl:text>\textit{</xsl:text>
            <xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:repository/text()"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\item Identifier: </xsl:text>
        <xsl:text>\textit{</xsl:text>
            <xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:idno/text()"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\item Facsimiles: </xsl:text>
        <xsl:text>\textit{</xsl:text>
            <xsl:value-of select="./tei:msDesc/tei:msIdentifier/tei:idno/@facs"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\item Content: </xsl:text>
        <xsl:text>\textit{</xsl:text>
        <xsl:value-of select="./tei:msDesc/tei:msContents/tei:msItem/tei:p/text()"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\end{compactitem}\vspace{7mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <xsl:text>\pdfbookmark[0]{Transcription}{transcription}</xsl:text>
        <xsl:apply-templates select=".//tei:seg"/>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'liturgical-section']">
        <xsl:if test="not(exists(@prev))">
            <xsl:text>\pdfbookmark[1]{</xsl:text>
                <xsl:value-of select="@n"/>
            <xsl:text>}{</xsl:text>
                <xsl:value-of select="@n"/>
            <xsl:text>}</xsl:text>
            <xsl:text>\par\vspace{3mm}\setLR </xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>\par\vspace{3mm}</xsl:text>
        </xsl:if>
        <xsl:text>\setRL </xsl:text>
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:pb"/>
    
    <xsl:template match="tei:cb">
        <xsl:text>\LR{\textit{\textbf{\hbox{(</xsl:text>
        <xsl:value-of select="replace(@n,'column','col.')"/>
        <xsl:text>)}}}}\nolinebreak\hspace{1.0mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:if test="not(local-name(preceding-sibling::*[1]) = 'pb') and not(local-name(preceding-sibling::*[1]) = 'cb')">
            <xsl:text>\LR{$|</xsl:text>
            <xsl:if test="(@n mod 5) = 0">
                <xsl:text>|</xsl:text>
            </xsl:if>
            <xsl:text>$}\nolinebreak\hspace{3mm}</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'rubric']">
            <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:if test="parent::tei:hi">
            <xsl:text>\begin{syriac}\textxecolor{red}{</xsl:text>
                <xsl:value-of select="."/>
            <xsl:text>}\end{syriac} </xsl:text>
        </xsl:if>
        <xsl:if test="not(parent::tei:hi) and not(ancestor::tei:seg[@type = 'heading'])">
            <xsl:text>\begin{syriac}\textxecolor{black}{</xsl:text>
                <xsl:value-of select="."/>
            <xsl:text>}\end{syriac} </xsl:text>
        </xsl:if>
        <xsl:if test="ancestor::tei:seg[@type = 'heading'] and not(parent::tei:hi)">
            <xsl:text>\begin{syriac}\textxecolor{black}{</xsl:text>
                <xsl:value-of select="."/>
            <xsl:text>}\end{syriac}</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:note[@type = 'addition']">
        <xsl:text>\LR{)}</xsl:text>
            <xsl:text>\begin{syriac}</xsl:text>
                <xsl:value-of select="text()"/>
            <xsl:text>\end{syriac}</xsl:text>
        <xsl:text>\LR{(in marg.}</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>