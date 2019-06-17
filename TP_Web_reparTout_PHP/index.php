<!DOCTYPE html>
<html lang="fr-fr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="./assets/icone.png">
  <meta name="author" content="Rachel BARETTO">
  <meta name="description" content="Un site de services autour des voitures et des réparations.">
  <meta name="keywords" content="repare, repar'tout, reparer, reparation, voiture, auto, vehicule, roue, html, css, site, website">
  <link href="./css/grid.css" rel="stylesheet">
  <title>Repar'Tout</title>
  <!-- Chemin absolu par http://localhost/ avec WAMP): /rbaretto/TPs_Web_reparTout/css/grid.css -->
</head>
<body class="monBody monTexte">
  
  <header>
    <a href="/"><img src="./assets/logo.svg" alt="Logo de ReparTout"></a>
  </header>

  <nav>
    <h3><a href="#">Menu</a></h3>
    <ul class="navMenu" id="nav">
    </ul>
  </nav>

  <section role="main" id="main">
    <?php
      include('catalogue.php');
    ?>
  </section>

  <aside>
    <h3>Commandes en cours</h3>
    <ul class="asideMenu">
      <li>Aucune commande.</li>
    </ul>
  </aside>

  <footer id="footer">
    &copy; 2019 Repar'Tout
  </footer>
  
  <script>
    
    // FONCTIONS APPELLEES
    function ajouterCategorie(nom, description)
    {
      let s='';
      s+='<tr>'
      s+= '<td>'+nom+'</td>';
      s+= '<td>'+description+'</td>';
      s+='</tr>';
      document.querySelector('table').innerHTML+=s;
      return true;
      //ooo rajoutera le contenu du form dans le tableau
    }
    
    // FONCTIONS ECOUTEURS   
    document.forms.ajout.onsubmit=function(event)
    {
      event.preventDefault();
      var nom=document.forms.ajout.nom;
      var desc=document.forms.ajout.desc;
      
      if (nom.value.match(nom.pattern))
      {
        ajouterCategorie(nom.value, desc.value);
        return true;
      }
      
      return false;
    };
    
  </script>
  
  <!-- ECRITURE DES MENUS LATERAUX -->
  <script src="./js/nav.js"></script>
  
  <!-- FONCTIONS GLOBALES -->
  <script src="./js/fonctions.js"></script>

</body>
</html>