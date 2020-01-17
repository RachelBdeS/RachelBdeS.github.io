<h2 id="welcome">Fournisseurs
  <button class="edit" onclick="showSpan('editForm');" title="">+</button>
</h2>
<p>Voici les fournisseurs.</p>

<span id="editForm">
  <h3>Ajouter un fournisseur</h3>
  <form action="" method="POST" name="ajoutt"> 
    <input type="hidden" id="numerof" name="numerof" value="0"><br> <!-- TEMP - Numéro du fournisseur (en attendant la lisaison avec la BDD qui fournira ce numéro -->
    <label for="nom_fournisseur">Nom</label>
    <input 
      type="text" 
      id="nom_fournisseur" name="nom_fournisseur" 
      placeholder="Nom" value="" 
      title="Doit contenir au moins deux caractères"
      pattern="[\w\s\-]{2,}"
    ><br>

    <label for="tel_fournisseur">Téléphone</label>
    <input 
      type="phone" 
      id="tel_fournisseur" name="tel_fournisseur" 
      placeholder="Téléphone" value="" 
      title="Doit contenir au moins 10 chiffres sans espaces (le signe + est accepté)"
      pattern="[0-9]{10,15}"
    ><br>

    <label for="adresse_fournisseur">Adresse</label>
    <textarea rows="2"
      id="adresse_fournisseur" name="adresse_fournisseur" 
      placeholder="Adresse" value="" 
      title="Exemple: 1 bd. Chose 68000 Ville Pays" 
      pattern="\d{1,}\s{1}([\w\-\.]{2,}\s{1}){1,}\d{5}\s{1}[\w\-\.]{2,}\s{1}[\w\-\.]{2,}"
    ></textarea><br>

    <label></label> 
    <input type="submit" id="btnSubmit" value="Envoyer">
  </form>
</span>

<h3>Dernièrs fournisseurs ajoutés</h3>
<table cellspacing="5" id="tFournisseurs">
  <tr>
    <th>Numéro</th>
    <th>Nom</th>
    <th>Téléphone</th>
    <th>Adresse</th>
  </tr>
</table>

<div><pre>
<?php

  function send_new_Fournisseur()
  {
    // Affiche les données passées en POST // DEBUG
    // echo var_export($_POST, true);

    // Si la connexion a réussi et le le formulaire rempli a été récupéré, 
    if($connexion !== NULL && $_POST)
    {
      // Affiche les données qui vont être envoyées dans un tableau créé plus haut // DEBUG
      // genererTableau($_POST); // DEBUG
      // Affiche une donnée en particulier // DEBUG
      // echo $_POST['nom_fournisseur']; // DEBUG

      // Déclare la requete SQL d'ajout d'une ligne de données dans la table fournisseurs
      $sql = "
        INSERT INTO fournisseurs
        ( 
          nom_fournisseur, 
          tel_fournisseur,
          adresse_fournisseur
        )
        VALUES
        (
          '".$_POST['nom_fournisseur']."',
          '".$_POST['tel_fournisseur']."',
          '".strip_tags($_POST['adresse_fournisseur'])."'
        );
      ";
  
      // Affiche la requête SQL crée
      echo 'Requête envoyée : <br>'.$sql;
      // Envoie la requête SQL à la BDD
      $connexion->exec($sql);
    }
  }

  function list_Fournisseurs()
  {
    if($connexion !== NULL)
    {
      $sql = "
        SELECT
        id_fournisseur, 
        nom_fournisseur,
        adresse_fournisseur
        FROM 
        fournisseurs;
      ";
      
      $dbResult = $connexion->query($sql);

      // echo var_export($dbResult, true);

      // Tant que le résultat de l'expression (CONDITION alternative : while(!$var && isset($var) && $var!=0))
      while(($ligne = $dbResult->fetch()) !== false)
      {
        echo 'id_fournisseur = '.$ligne['id_fournisseur'];
        echo ''.$ligne['nom_fournisseur'].' ';
        echo $ligne['tel_fournisseur'].' '.$ligne['adresse_fournisseur'].'<hr>';
      }

      /* 
      foreach($dbResult->fetchAll() as $ligne)
      {
        echo 'id_fournisseur = '.$ligne['id_fournisseur'];
        echo ''.$ligne['nom_fournisseur'].' ';
        echo $ligne['tel_fournisseur'].' '.$ligne['adresse_fournisseur'].'<hr>';
      }
      */

      // Affiche la requête SQL crée
      echo 'Requête envoyée : <br>'.$sql;
      // Envoie la requête SQL à la BDD
      $connexion->exec($sql);
    }
  }



?></pre>
</div>
