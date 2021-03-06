<g:set var="orgNameLong" value="${grailsApplication.config.skin.orgNameLong}"/>
<g:set var="orgNameShort" value="${grailsApplication.config.skin.orgNameShort}"/>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <meta name="app.version" content="${g.meta(name:'app.version')}"/>
 <meta name="app.build" content="${g.meta(name:'app.build')}"/>
 <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
 <g:if test="${instance}">
 <meta name="description" content="${orgNameLong} description of the ${instance?.name}. ${instance?.makeAbstract(200)}"/>
</g:if>
<g:else>
<meta name="description" content="Explore les collections d'histoire naturelle du  ${orgNameLong}"/>
</g:else>
<title><g:layoutTitle /></title>
<g:render template="/layouts/global"/>
<r:require modules="jquery, jquery_migration, bootstrap3, application, collectory, alf" />
   <%--
      <r:require modules="jquery, jquery_i18n, bootstrap, application, collectory" />
      --%>

    </style>
    <r:script disposition='head'>
        // initialise plugins
        jQuery(function(){
            // autocomplete on navbar search input
            jQuery("form#search-form-2011 input#search-2011, form#search-inpage input#search, input#search-2013").autocomplete('http://bie.ala.org.au/search/auto.jsonp', {
                extraParams: {limit: 100},
                dataType: 'jsonp',
                parse: function(data) {
                    var rows = new Array();
                    data = data.autoCompleteList;
                    for(var i=0; i<data.length; i++) {
                        rows[i] = {
                            data:data[i],
                            value: data[i].matchedNames[0],
                            result: data[i].matchedNames[0]
                        };
                    }
                    return rows;
                },
                matchSubset: false,
                formatItem: function(row, i, n) {
                    return row.matchedNames[0];
                },
                cacheLength: 10,
                minChars: 3,
                scroll: false,
                max: 10,
                selectFirst: false
            });

            // Mobile/desktop toggle
            // TODO: set a cookie so user''s choice is remembered across pages
            var responsiveCssFile = $("#responsiveCss").attr("href"); // remember set href
            $(".toggleResponsive").click(function(e) {
                e.preventDefault();
                $(this).find("i").toggleClass("icon-resize-small icon-resize-full");
                var currentHref = $("#responsiveCss").attr("href");
                if (currentHref) {
                    $("#responsiveCss").attr("href", ""); // set to desktop (fixed)
                    $(this).find("span").html("Mobile");
                } else {
                    $("#responsiveCss").attr("href", responsiveCssFile); // set to mobile (responsive)
                    $(this).find("span").html("Desktop");
                }
            });

            $('.helphover').popover({animation: true, trigger:'hover'});
        });
    </r:script>
    <r:layoutResources/>
    <g:layoutHead />
</head>
<body class="${pageProperty(name:'body.class')?:'nav-collections'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">

    <div class="contenu-total">
    <header class="row-fluid">
        <a href="http://www.gbif.fr"><img src="/images/header_gbif_site.png" alt="Le GBIF France"></a>
    </header>
    <div class="navbar-header format">
        <div class="contenu_page">
            <div class="row menu-gbif">
                <div class="menu_navigation col-xs-12 col-sm-8">
                    <ul class="menu nav">
                        <li class="dropdown">
                            <a id="sinformer" class="dropdown-toggle" data-target="#" href="http://www.gbif.fr/page/infos/quest-ce-que-le-gbif" role="button">
                                s'informer  <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="http://www.gbif.fr/page/infos/quest-ce-que-le-gbif">Accueil</a></li>
                                <li><a href="http://www.gbif.fr/page/infos/presentation-du-gbif-france">Point Nodal Fran&ccedilais</a></li>
                                <li><a href="http://www.gbif.fr/page/infos/actions-du-point-nodal">Actions du point nodal</a></li>
                                <li><a href="http://www.gbif.fr/actualites">Actualit&eacutes</a></li>
                                <li><a href="http://www.gbif.fr/agenda">Agenda</a></li>
                                <li><a href="http://www.gbif.fr/page/infos/foire-aux-questions">Foire aux Questions</a></li>
                                <li><a href="http://www.gbif.fr/newsletter/subscriptions">Inscriptions aux Newsletters</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a id="contribuer" class="dropdown-toggle" data-target="#" href="http://www.gbif.fr/page/contrib/connecter-des-donnees-au-gbif" role="button">
                                contribuer <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="http://www.gbif.fr/page/contrib/connecter-des-donnees-au-gbif">Connecter des donn&eacutees au GBIF</a></li>
                                <li><a href="http://www.gbif.fr/page/contrib/publier-un-datapaper">Publier un datapaper</a></li>
                                <li><a href="http://www.gbif.fr/page/contrib/numerisation-des-donnees">Num&eacuterisation des donn&eacutees</a></li>
                                <li><a href="http://www.gbif.fr/page/contrib/metadonnees">M&eacutetadonn&eacutees</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <!--<a href="http://www.gbif.fr/page/consult/acces-aux-donnees-et-metadonnees">-->
                            <a id="consulter" class="dropdown-toggle" data-target="#" href="http://www.gbif.fr/page/consult/acces-aux-donnees-et-metadonnees" role="button">
                                consulter <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="http://portail.gbif.fr">Acc&egraves au portail fran&ccedilais du GBIF</a></li>
                                <li><a href="http://www.gbif.org" target="_blank">Acc&egraves au portail international du GBIF</a></li>
                                <li><a href="http://metadonnee.gbif.fr/admin">Acc&egraves à l'administration du portail français du GBIF</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a id="utiliser" class="dropdown-toggle" data-target="#" href="http://www.gbif.fr/page/utiliser/exemples-dutilisation-des-donnees" role="button">
                                utiliser <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="http://www.gbif.fr/page/utiliser/exemples-dutilisation-des-donnees">Exemples d'utilisation des donn&eacutees du GBIF</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a id="ressources" class="dropdown-toggle" data-target="#" href="http://www.gbif.fr/page/ressources/documentation" role="button">
                                ressources <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="http://www.gbif.fr/page/ressources/documentation">Documentation</a></li>
                                <li><a href="http://www.gbif.fr/page/ressources/rapports-comptes-rendus">Rapports et comptes rendus</a></li>
                                <li><a href="http://www.gbif.fr/page/ressources/guides">Guides GBIF/Manuels</a></li>
                                <li><a href="http://www.gbif.fr/datapapers">Data Papers</a></li>
                                <li><a href="http://www.gbif.fr/page/ressources/posters">Posters</a></li>
                                <li><a href="http://www.gbif.fr/page/ressources/liens">Sites Internet utiles</a></li>
                                <li><a href="http://www.gbif.fr/page/ressources/outils-du-gbif">Outils du GBIF</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a id="partenaires" class="dropdown-toggle" data-target="#" href="http://www.gbif.fr/page/partenaires" role="button">
                                partenaires <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="http://www.gbif.fr/page/partenaires">Organismes de tutelle</a></li>
                                <li><a href="http://www.gbif.fr/page/partenaires/partenaires">Partenaires</a></li>
                                <li><a href="http://www.gbif.fr/page/partenaires/fournisseurs-de-donnees">Fournisseurs de donn&eacutees</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
             </div>
         </div>
    </div>
    <div class="container" id="main-content">
        <div class="content format">
            <div class="row">
                <div class="block-breadcrumb col-sm-6 col-md-6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="http://www.gbif.fr">Accueil</a>
                            <span class="divider">/</span>
                        </li>
                        <li>
                            <a href="http://www.gbif.fr/page/consult/acces-aux-donnees-et-metadonnees">Contribuer</a>
                            <span class="divider">/</span>
                        </li>
                        <li>
                            <a href="http://portail.gbif.fr">Portail Atlas of Living France</a>
                            <span class="divider">/</span>
                        </li>
                        <li>
                            Les métadonnées
                        </li>
                    </ul>
                </div>
                <div class="currentdate">
                    <div id="block-block-6" class="block block-block clearfix">
                        <script language="javascript">
                        today = new Date();
                        var options = {
                            weekday: "long", year: "numeric", month: "long", day: "2-digit"
                        };
                        document.write(today.toLocaleDateString("fr-fr", options));
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <g:layoutBody />
        <div class="row-fluid">
            <div class="col-md-3 vcenter">
                <div>   
                    <a href="http://www.ala.org.au/" target="_blank">
                        <img src="/images/ala-white.png" class="img-responsive center-block" alt="Atlas of Living Australia">
                    </a> 
                </div>
            </div>
            <div class="col-md-3 vcenter">
                <div>
                    <a href="https://crowdin.com/" target="_blank">
                        <img src="/images/crowdin-white.png" class="img-responsive center-block" alt="Crowdin">
                    </a>
                </div>
            </div>
            <div class="col-md-3 vcenter">
                <div>
                    <a href="http://www.gbif.org/" target="_blank">
                        <img src="/images/logo-gbif.jpg" class="img-responsive center-block" alt="GBIF">
                    </a>
                </div>
            </div>
            <div class="col-md-3 vcenter">
                <div>
                    <a href="http://www.gbif.fr/" target="_blank">
                        <img src="/images/gbif-fr.png" class="img-responsive center-block" alt="GBIF France">
                    </a>
                </div>
            </div>
        </div>
    </div><!--/.container-->

    <!--
    <footer>
        <div class="footer-margin social">
            <ul>
                <li>
                    <a target="_blank" href="http://twitter.com/gbiffrance" title="Rejoignez sous sur Twitter !">
                        <img width="16" height="16" src="/images/twitter.png" alt="twitter logo">
                    </a>
                </li>
                <li>
                    <a target="_blank" href="/news.xml" title="Suivez notre actualité (Flux RSS)">
                        <img width="16" height="16" src="/images/rss.png" alt="RSS logo">
                    </a>
                </li>
                <li>
                    <a target="_blank" title="Page Facebook du GBIF" href="https://www.facebook.com/gbifnews">
                        <img width="16" height="16" src="/images/facebook.png" alt="Facebook logo">
                    </a>
                </li>
            </ul>
        </div>
        <div class="footer-margin">
            <ul id="footer-link">
                <li ><a  target="_blank" title="" href="http://www.gbif.fr">Accueil</a></li>
                <li ><a target="_blank" title="" href="http://www.gbif.fr/contact">Contact</a></li>
                <li ><a title="" href="http://www.gbif.fr/content/mentions-legales">Mentions l&eacutegales</a></li>
                <li ><a href="http://www.gbif.fr/sitemap">Plan du site</a> </li>
            </ul>
        </div>
        <address class="footer-margin">
            <p>GBIF FRANCE ● MNHN G&eacuteologie ● 43 rue Buffon CP 48 &#150; 75005 Paris  &#150; France  &#150; <span style="line-height:1.6">T&eacutel. : +33 (0)1 40 79 80 65</span></p>
        </address>
    </footer>
    -->
    <div id="footer">
        <div class="region-footer">
            <div class="contenu_page">
                <div class="social_icons">
                    <ul>
                        <li>
                            <a target="_blank" href="http://twitter.com/gbiffrance" title="Rejoignez sous sur Twitter !">
                                <img width="28" height="28" src="/images/Logo-Twitter-white.png" alt="twitter logo">
                            </a>
                        </li>
                        <li>
                            <a target="_blank" title="Page Facebook du GBIF" href="https://www.facebook.com/gbifnews">
                                <img width="28" height="28" src="/images/Logo-Facebook.png" alt="Facebook logo">
                            </a>
                        </li>
                    </ul>
                </div>
                <div id="block-menu-menu-links-footer">
                    <ul class="menu nav">
                        <li ><a  target="_blank" title="" href="http://www.gbif.fr">Accueil</a></li>
                        <li ><a target="_blank" title="" href="http://www.gbif.fr/contact">Contact</a></li>
                        <li ><a title="" href="http://www.gbif.fr/content/mentions-legales">Mentions l&eacutegales</a></li>
                        <li ><a href="http://www.gbif.fr/sitemap">Plan du site</a> </li>
                        <li ><a href="http://www.gbif.fr/user">Administration</a> </li>
                    </ul>
                </div>
                <address class="footer-margin">
                    <p>
                        GBIF FRANCE ● MNHN G&eacuteologie ● 43 rue Buffon CP 48 &#150; 75005 Paris  &#150; France  &#150; <span style="line-height:1.6">T&eacutel. : +33 (0)1 40 79 80 65</span>
                     </p>
                </address>
             </div>
        </div>
    </div>
        </div>
    <r:layoutResources/>
</body>
</html>