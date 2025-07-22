<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output encoding="UTF-8" method="text"/>
    
    <xsl:template match="tei:TEI">
        <xsl:text>\documentclass[11pt,a4paper,titlepage]{article}
        \usepackage{polyglossia}
        %\usepackage{fontspec,xltxtra}
        \usepackage{paralist}
        \usepackage{xecolor}
        \usepackage{hyperref}
        \hypersetup{pdftex,colorlinks=true}
        \usepackage{hypcap}
        \usepackage{morefloats}
        \let\myfont\normalfont
        \usepackage{fancyhdr}
        \pagestyle{fancy}
        \chead{\myfont\textit{Annunciation of Zechariah}}
        \renewcommand\footrulewidth{0.4pt}
        %\fancyfoot[L]{\myfont\textsc{Ephrem Aboud Ishac}}
        \fancyfoot[C]{\myfont\thepage}
        \setmainlanguage{english}
        \setotherlanguages{syriac}
        \newfontfamily\syriacfont[Script=Syriac,Scale=1.5,ExternalLocation="./melthofonts/"]{SertoAntochBible_2020_Release.ttf}
        \parindent0pt
        \usepackage{bidi}
        \begin{document}
        \begin{titlepage}
        \begin{center}</xsl:text>
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
        <xsl:text>\end{center}</xsl:text>
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
        <xsl:text>\end{titlepage}</xsl:text>
        <xsl:apply-templates select="tei:text/tei:body/tei:div[@type = 'transcription']"/>
        <xsl:text>\end{document}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:titleStmt">
        <xsl:text>\pdfbookmark[0]{Title}{title}</xsl:text>
        <xsl:text>\Large\textbf{</xsl:text>
            <xsl:value-of select="./tei:title[not(@type)]/text()"/>
            <xsl:text>}\par\textbf{</xsl:text>
            <xsl:value-of select="./tei:title[@type = 'sub']"/>
        <xsl:text>}\normalsize\par\vspace{10mm}</xsl:text>
        <xsl:value-of select="./tei:respStmt/tei:resp/text()"/>
        <xsl:text>\par\vspace{5mm}\large </xsl:text>
            <xsl:value-of select="./tei:respStmt/tei:name/text()"/>
        <xsl:text>\normalsize\par\vspace{10mm}</xsl:text>
        <xsl:value-of select="./tei:respStmt/tei:note[@type = 'project-number']/text()"/>
        <xsl:text>\par </xsl:text>
        <xsl:value-of select="./tei:respStmt/tei:note[@type = 'project-name']/text()"/>
        <xsl:text>\par\vspace{5mm}</xsl:text>
        <xsl:value-of select="./tei:funder/tei:orgName/tei:ref/text()"/>
    </xsl:template>
    
    <xsl:template match="tei:publicationStmt">
        <xsl:text>\pdfbookmark[0]{Publication Statement}{publication}</xsl:text>
        <xsl:text>Licence: \textit{</xsl:text>
            <xsl:value-of select="./tei:availability/tei:licence"/>
        <xsl:text>}\par</xsl:text>
        <xsl:text> Date of publication: \textit{</xsl:text>
            <xsl:value-of select="./tei:date"/>
        <xsl:text>}\par\vspace{5mm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc">
        <xsl:text>\pdfbookmark[0]{Manuscript}{0}</xsl:text>
        <xsl:text>Manuscript: </xsl:text>
        <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:repository/text()"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:idno/text()"/>
        <xsl:text>\par</xsl:text>
        <xsl:text>\begin{compactitem}</xsl:text>
        <xsl:if test="exists(tei:msDesc/tei:msContents)">
            <xsl:apply-templates select="tei:msDesc/tei:msContents/tei:msItem"/>
        </xsl:if>
        <xsl:if test="exists(tei:msDesc/tei:physDesc)">
            <xsl:apply-templates select="tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc"/>
        </xsl:if>
        <xsl:if test="exists(tei:msDesc/tei:history)">
            <xsl:apply-templates select="tei:msDesc/tei:history"/>
        </xsl:if>
        <xsl:text>\end{compactitem}</xsl:text>
        <xsl:text>\par\newpage </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:msItem">
        <xsl:text>\item </xsl:text>
        <xsl:value-of select="tei:locus/text()"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select="tei:title/text()"/>
    </xsl:template>
    
    <xsl:template match="tei:supportDesc">
        <xsl:text>\item </xsl:text>
        <xsl:value-of select="child::tei:p/text()"/>
    </xsl:template>
    
    <xsl:template match="tei:history">
        <xsl:text>\item </xsl:text>
        <xsl:value-of select="child::tei:p/text()"/>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <xsl:text>\pdfbookmark[0]{Transcription}{transcription}</xsl:text>
        <xsl:text>\begin{center}\textbf{Transcription}\end{center}\vspace{5mm}</xsl:text>
        <xsl:text>\RTL{</xsl:text>
        <xsl:apply-templates select="child::*"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'liturgical-section']">
        <xsl:text>\pdfbookmark[0]{</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>}{</xsl:text>
        <xsl:value-of select="lower-case(@n)"/>
        <xsl:text>}</xsl:text>
        <xsl:text>\vspace{5mm}\LTR{\textit{</xsl:text>
        <xsl:value-of select="@n"/>
        <xsl:text>}}\par\vspace{5mm}\RTL{</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:ab">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:pb"/>
    
    <xsl:template match="tei:cb">
        <xsl:if test="local-name(preceding-sibling::*[1]) = 'pb'">
            <xsl:text>\LR{\textit{\textbf{(</xsl:text>
            <xsl:value-of select="preceding-sibling::tei:pb[1]/@n"/>
            <xsl:text> col. </xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>)}}}\nolinebreak\hspace{2mm} </xsl:text>
        </xsl:if>
        <xsl:if test="local-name(preceding-sibling::*[1]) != 'pb'">
            <xsl:text>\LR{\textit{\textbf{(</xsl:text>
                <xsl:value-of select="concat('col. ',@n)"/>
            <xsl:text>)}}}\nolinebreak\hspace{2mm} </xsl:text>
        </xsl:if>
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
    
    <xsl:template match="tei:hi[@rend = 'emphasized']">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:if test="parent::tei:hi[@rend = 'emphasized']">
            <xsl:text>\begin{syriac}\textxecolor{red}{</xsl:text>
                <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>}\end{syriac} </xsl:text>
        </xsl:if>
        <xsl:if test="not(parent::tei:hi)">
            <xsl:choose>
                <xsl:when test="normalize-space(.) = ''"></xsl:when>
                <xsl:when test="normalize-space(.) = ' '"></xsl:when>
                <xsl:otherwise>
                    <xsl:text>\begin{syriac}\textxecolor{black}{</xsl:text>
                        <xsl:value-of select="normalize-space(.)"/>
                    <xsl:text>}\end{syriac} </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>