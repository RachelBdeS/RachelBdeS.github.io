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
  
  <header tabindex="-1">
    <a href="./accueil" id="logo"><img src="./assets/logo.svg" alt="Logo de ReparTout" id="logo"></a>
  </header>

  <nav>
    <h3><a href="#" tabindex="-1">Menu</a></h3>
    <ul class="navMenu" id="nav">
      <li><a href="./categories" tabindex="1">Catégories</a></li>
      <li><a href="./fournisseurs" tabindex="2">Fournisseurs</a></li>
      <li><a href="./catalogue" tabindex="3">Catalogue</a></li>
      <li><a href="./pneus" tabindex="4">Pneus</a></li>
      <li><a href="./clients" tabindex="5">Clients</a></li>
      <li><a href="./commandes" tabindex="6">Commandes</a></li>
    </ul>
  </nav>

  <section role="main" id="main">
    <?php
    
    if(!empty($_GET['page']) && $_GET['page']!='index')
    {
      // basename($_GET["varibale_d'url"]) permet d'empêcher les injections php dans l'url puisque seul le dernier dossier est pris en considération.
      $filename = basename($_GET['page']).'.php';

      if(file_exists($filename))
      {
        require $filename;
      }
      else {
        echo "<br><center>La page demandée n'a pas été trouvée.";
      }
    }
    else {
      require 'accueil.php';
    }
    
    ?>
  </section>

  <aside>
    <h3>Commandes en cours</h3>
    <ul class="asideMenu" tabindex="7">
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

    function showSpan(id) 
    {
      let e = document.getElementById(id);
                                      
      if(e.style.display == 'none') 
      {
        e.style.display = 'inline';
        document.querySelector('button.edit').innerHTML = '-';
      } 
      else {
        e.style.display = 'none';
        document.querySelector('button.edit').innerHTML = '+';
      }
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
  
</body>
</html>