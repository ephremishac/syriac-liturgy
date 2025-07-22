<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0"/>
    
    <xsl:template match="/">
        <html lang="en-US">
            <head>
                <meta charset="UTF-8"></meta>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>
                <meta name="mobile-web-app-capable" content="yes"></meta>
                <meta name="apple-mobile-web-app-capable" content="yes"></meta>
                <meta name="apple-mobile-web-app-title" content="Syriac Liturgy - Fenqiotho"></meta>
                                        <link rel="profile" href="http://gmpg.org/xfn/11"></link>
                <title><xsl:value-of select="concat('Syriac Liturgy - Fenqiotho - ',tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[1]/text())"/></title>
                                            <link rel="stylesheet" id="fundament-styles"  href="./fundament/css/fundament.min.css" type="text/css"/>
                                            <link rel="stylesheet" href="./fundament/css/custom.css" type="text/css"/>
                                            <link rel="icon" type="image/png" href="./favicon.png"/>
            </head>
            <body class="home">
                <div class="hfeed site" id="page">
                    <!-- ******************* The Navbar Area ******************* -->
                    <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" itemscope="itemscope" itemtype="http://schema.org/WebSite">
                        <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="container" >
                                <!-- Your site title as branding in the menu -->
                                <a href="./index.html" class="navbar-brand custom-logo-link" rel="home" itemprop="url"><img src="./fundament/images/logo.png" class="img-fluid logo-round" alt="Fundament Logo" itemprop="logo" /></a><!-- end custom logo -->
                                <a class="navbar-brand site-title-with-logo" rel="home" href="./index.html" title="Syriac Liturgy" itemprop="url">Syriac Liturgy</a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                    <!-- Your menu goes here -->
                                    <ul id="main-menu" class="navbar-nav">
                                        <li class="nav-item active"><a title="Home" href="./index.html" class="nav-link">Home</a></li>
                                        <li class="nav-item dropdown">
                                            <a title="Transcriptions" href="./index.html" data-toggle="dropdown" class="nav-link dropdown-toggle">Transcriptions<span class="caret"></span></a>
                                            <ul class=" dropdown-menu" role="menu">
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Anaphoras" href="./anaphoras.html" class="nav-link">Anaphoras</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Fenqiotho" href="./fenqiotho.html" class="nav-link">Fenqiotho</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Shimo" href="./shimo.html" class="nav-link">Shimo</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Beth Gazo" href="./beth-gazo.html" class="nav-link">Beth Gazo</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Commentaries" href="./commentaries.html" class="nav-link">Commentaries</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Baptism" href="./baptism.html" class="nav-link">Baptism</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Wedding" href="./wedding.html" class="nav-link">Wedding</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Funerals" href="./funerals.html" class="nav-link">Funerals</a>
                                                </li>
                                                <li class="nav-item dropdown-submenu">
                                                    <a title="Lectionaries" href="./lectionaries.html" class="nav-link">Lectionaries</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item"><a title="Dictionary" href="./dictionary.html" class="nav-link">Dictionary</a></li>
                                        <li class="nav-item"><a title="Search" href="./search.html" class="nav-link">Search</a></li>
                                        <li class="nav-item"><a title="Research Output" href="./research-output.html" class="nav-link">Research Output</a></li>
                                        <li class="nav-item"><a title="New Findings" href="./new-findings.html" class="nav-link">New Findings</a></li>
                                        <li class="nav-item"><a title="About" href="./about.html" class="nav-link">About</a></li>
                                    </ul>
                                </div>
                                <!-- .collapse navbar-collapse -->
                            </div>
                            <!-- .container -->
                        </nav>
                        <!-- .site-navigation -->
                    </div>
                    <!-- .wrapper-navbar end -->
                    <div id="wrapper-hero-content-sub"><img src="./fundament/images/header-image.jpg" style="height: 90px; width: 1199px;"></img></div>
                    
                    <div id="wrapper-hero-content-sub" class="border-top-brown" style="padding: 2em;">
                        <h3>Syriac Liturgy</h3>
                        <h1>Fenqiotho</h1>
                        <xsl:element name="h3">
                            <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[1]/text()"/>
                        </xsl:element>
                        <p>Beta version</p>
                    </div>
                    <div class="wrapper" id="index-wrapper">
                        <div class="container" id="content" tabindex="-1">
                            <div class="row">
                                <!-- Do the left sidebar check and opens the primary div -->
                                <div class="col-md-12 content-area" id="primary">
                                    <main class="site-main" id="main">
                                        <!-- Use custom content block templates if they are defined -->
                                        <h5 class="content-block-title"><span class="separator-title">Fenqiotho</span></h5>
                                        <div class="card-wrapper">
                                            <article class="col-md-4"></article>
                                            <article class="card col-md-4 flat-style">
                                                <div class="card-inner card-vertical" style="height:230px;">
                                                    <a class="entry-top-thumbnail" style="height:230px;" href="./fenqiotho.html" rel="bookmark">
                                                        <img width="1024" height="684" src="./fundament/images/button-fenqiotho.jpg" alt="fenqiotho"/>
                                                    </a>
                                                    <!-- .entry-text-content -->
                                                </div>
                                                <!-- .card-inner -->
                                            </article>
                                            <article class="col-md-4">
                                                
                                            </article>
                                            <!-- #post-## -->
                                        </div>
                                    </main>
                                    <!-- #main -->
                                    <!-- The pagination component -->
                                </div>
                                <!-- #primary -->
                                <!-- Do the right sidebar check -->
                            </div>
                            <!-- .row -->
                        </div>
                        <!-- Container end -->
                    </div>
                    
                    <div class="wrapper" id="single-wrapper">
                        <div class="container" id="content" tabindex="-1">
                            <div class="row">
                                <div class="col-md-12 content-area" id="primary">
                                    <main class="site-main" id="main">
                                        <article style="background-color: white; padding:20pt;">
                                            <header class="entry-header">
                                                <h1 class="entry-title text-center"><xsl:value-of select="concat(tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[1]/text(),' - ',tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[2]/text())"/></h1>
                                            </header><!-- .entry-header -->
                                            <div class="entry-content">
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[1]/tei:resp/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h3">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[1]/tei:name/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:resp/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h3">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:persName/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:note[@type = 'project-number']/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:note[@type = 'project-name']/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:funder/tei:orgName/tei:ref/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date/text()"/>
                                                </xsl:element>
                                                <xsl:element name="h5">
                                                    <xsl:attribute name="class" select="'text-center'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:licence/text()"/>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:element name="b">
                                                        <xsl:value-of select="'Manuscript:'"/>
                                                    </xsl:element>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="style" select="'margin-left: 20pt;'"/>
                                                    <xsl:value-of select="concat(tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository/text(),' - ',tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text())"/>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="style" select="'margin-left: 20pt;'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:p/text()"/>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="style" select="'margin-left: 20pt;'"/>
                                                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:history/tei:p/text()"/>
                                                </xsl:element>
                                            </div><!-- .entry-content -->
                                            <div class="entry-content">
                                                <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type = 'transcription']"/>
                                                <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div[@type = 'bibliography']"/>
                                            </div>
                                        </article>
                                    </main><!-- #main -->
                                </div><!-- #primary -->
                            </div><!-- .row -->
                        </div><!-- Container end -->
                    </div>
                    <!-- Wrapper end -->
                    <div class="wrapper fundament-default-footer" id="wrapper-footer-full">
                        <div class="row">
                            <div class="col-md-2"/>
                            <div class="footer-widget col-md-4">
                                <div class="textwidget custom-html-widget">
                                    <a href="https://www.oeaw.ac.at/imafo"><img src="./fundament/images/imafo-logo.png"></img></a>
                                </div>
                            </div>
                            <div class="footer-widget col-md-4">
                                <div class="text-widget custom-html-widget">
                                    <a href="https://www.fwf.ac.at"><img src="./fundament/images/logo.svg"></img></a>
                                </div>
                            </div>
                            <div class="col-md-2"/>
                        </div>
                    </div>
                    <!-- #wrapper-footer-full -->
                    <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;">
                        © Copyright OEAW | <a href="https://www.oeaw.ac.at/die-oeaw/impressum/">Impressum/Imprint</a>
                    </div>
                </div>
                <!-- #page we need this extra closing tag here -->
                <script type="text/javascript" src="./fundament/vendor/jquery/jquery.min.js"></script>
                <script type="text/javascript" src="./fundament/js/fundament.min.js"></script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'transcription']">
        <xsl:apply-templates select="descendant::tei:seg[@type = 'liturgical-section'][not(exists(@prev))]"/>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type = 'liturgical-section'][not(exists(@prev))]">
        <xsl:variable name="self" select="self::tei:seg"/>
        <xsl:element name="h3">
            <xsl:value-of select="@n"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="style" select="'font-size: 16pt; text-align: right;'"/>
            <xsl:attribute name="dir" select="'RTL'"/>
            <xsl:apply-templates select="child::node()"/>
            <xsl:if test="exists(ancestor::tei:div[@type = 'transcription']/descendant::tei:seg[exists(@prev)][substring-after(@prev,'#') = $self/@xml:id])">
                <xsl:call-template name="following-segments">
                    <xsl:with-param name="segment" select="ancestor::tei:div[@type = 'transcription']/descendant::tei:seg[exists(@prev)][substring-after(@prev,'#') = $self/@xml:id]"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="following-segments">
        <xsl:param name="segment"/>
        <xsl:apply-templates select="$segment/child::node()"/>
        <xsl:if test="exists(ancestor::tei:div[@type = 'transcription']/descendant::tei:seg[exists(@prev)][substring-after(@prev,'#') = $segment/@xml:id])">
            <xsl:call-template name="following-segments">
                <xsl:with-param name="segment" select="ancestor::tei:div[@type = 'transcription']/descendant::tei:seg[exists(@prev)][substring-after(@prev,'#') = $segment/@xml:id]"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:ab">
        <xsl:apply-templates select="child::node()"/>
    </xsl:template>
    
    <xsl:template match="tei:cb">
        <xsl:if test="local-name(preceding-sibling::*[1]) = 'pb'">
            <xsl:element name="b">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="preceding-sibling::tei:pb[1]/@n"/>
                <xsl:text> col. </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text>) </xsl:text>
            </xsl:element>
        </xsl:if>
        <xsl:if test="local-name(preceding-sibling::*[1]) != 'pb'">
            <xsl:element name="b">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="concat('col. ',@n)"/>
                <xsl:text>) </xsl:text>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:pb"/>
    
    <xsl:template match="tei:lb">
        <xsl:element name="span">
            <xsl:attribute name="style" select="'font-style: italic;'"/>
            <xsl:value-of select="concat(' (',@n,') ')"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'emphasized']">
        <xsl:element name="span">
            <xsl:attribute name="style" select="'color: red'"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="child::node()"/>
            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'rubric']">
        <xsl:element name="span">
            <xsl:attribute name="style" select="'color: red'"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="child::node()"/>
            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:note[@type = 'textcritical-note']">
        <xsl:text> [</xsl:text>
        <xsl:apply-templates select="child::node()"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:note[@type = 'marginal-note']">
        <xsl:element name="span">
            <xsl:attribute name="dir" select="'LTR'"/>
            <xsl:text> [in margin: </xsl:text>
            <xsl:apply-templates select="child::node()"/>
            <xsl:text>] </xsl:text>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'bibliography']">
        <xsl:element name="div">
            <xsl:element name="p">
                <xsl:element name="a">
                    <xsl:attribute name="href" select="child::tei:bibl/@facs"/>
                    <xsl:attribute name="target" select="'_blank'"/>
                    <xsl:element name="span">
                        <xsl:attribute name="style" select="'font-variant: small-caps;'"/>
                        <xsl:value-of select="child::tei:bibl/tei:name/text()"/>
                    </xsl:element>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="child::tei:bibl/tei:title/text()"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:foreign[@xml:lang = 'la']">
        <xsl:element name="span">
            <xsl:attribute name="dir" select="'LTR'"/>
            <xsl:apply-templates select="child::node()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>