<?php 
  // header("Location:./clients");
?>

<h2 id="welcome">Clients<button class="edit" onclick="showSpan('editForm');" title="">-</button></h2>
<p>Voici les clients.</p>

<span id="editForm">
  <h3>Ajouter un client</h3>
  <form action="" method="GET" name="ajout">
      <input
        type="hidden" 
        id="numero" 
        name="numero" 
        value="" 
        pattern="[0-9]+"
        readonly
      ><br>
    <label for="nom">Nom</label>
    <input 
      type="text" 
      id="nom" 
      name="nom" 
      placeholder="Nom"
      title="Doit contenir au moins deux caractères"
      pattern="[\w\s\-]{2,}"
      value="" 
    ><br>
    <label for="prenom">Prénom</label>
    <input 
      type="text" 
      id="prenom" 
      name="prenom" 
      placeholder="Prénom"
      title="Doit contenir au moins deux caractères"
      pattern="[\w\s\-\]{2,}"
      value=""
    ><br>
    <label for="adresse">Adresse</label>
    <input 
      type="text" 
      id="adresse" 
      name="adresse" 
      placeholder="Adresse"
      title="Exemple: 1 bd. Chose 68000 Ville Pays"
      pattern="\d{1,}\s{1}([\w\-\.]{2,}\s{1}){1,}\d{5}\s{1}[\w\-\.]{2,}\s{1}[\w\-\.]{2,}"
      value="" 
    ><br>
    <label for="tel">Téléphone</label>
    <input 
      type="phone" 
      id="tel" 
      name="tel" 
      placeholder="Téléphone"
      title="Doit contenir au moins 10 chiffres sans espaces (le signe + est accepté)"
      pattern="[0-9]{10,15}"
      value="" 
    ><br>
    <label></label><input type="submit">
  </form>
</span>

<h3>Dernièrs clients ajoutés</h3>
<table cellspacing="5">
  <tr>
    <th>Numéro</th>
    <th>Nom</th>
    <th>Prénom</th>
    <th>Adresse</th>
    <th>Téléphone</th>
  </tr>
</table>
