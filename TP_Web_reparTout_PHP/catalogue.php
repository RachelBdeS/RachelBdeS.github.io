<?php 
  // header("Location:./fccatalogue");
?>

<h2 id="welcome">Pneus<button class="edit" onclick="showSpan('editForm');" title="">-</button></h2>
<p>Voici les pneus.</p>

<span id="editForm">
  <h3>Ajouter un pneu</h3>
  <form action="" method="GET" name="ajout">
    <label for="nom">Marque</label>
    <input 
      type="text" 
      id="nom" 
      name="nom" 
      placeholder="Nom"
      title=""
      pattern="[a-zA-Z0-9\s]+"
      value="" 
    ><br>
    <label for="nom">Nom</label>
    <input 
      type="text" 
      id="marque" 
      name="marque" 
      placeholder="Marque"
      title=""
      pattern="[a-zA-Z0-9\s]+"
      value="" 
    ><br>
    <label for="desc">Diamètre</label>
    <input 
      type="text" 
      id="diametre" 
      name="diametre" 
      value=""
      placeholder="Diamètre"
      title=""
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Structure</label>
    <input 
      type="text" 
      id="structure" 
      name="structure" 
      value=""
      placeholder="Structure"
      title=""
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Largeur</label>
    <input 
      type="text" 
      id="largeur" 
      name="largeur" 
      value=""
      placeholder="Largeur"
      title=""
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Usage</label>
    <input 
      type="text" 
      id="usage" 
      name="usage" 
      value=""
      placeholder="Usage"
      title=""
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Indice de charge</label>
    <input 
      type="text" 
      id="charge" 
      name="charge" 
      value=""
      placeholder="Indice de charge"
      title=""
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Indice de vitesse</label>
    <input 
      type="text" 
      id="vitesse" 
      name="vitesse" 
      value=""
      placeholder="Indice de vitesse"
      title=""
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Prix d'achat HT</label>
    <input 
      type="text" 
      id="pxAchatHT" 
      name="pxAchatHT" 
      value=""
      placeholder="Prix d'achat HT"
      pattern="[a-zA-Z]+"
    ><br>
    <label for="desc">Prix de vente HT</label>
    <input 
      type="text" 
      id="pxVenteHT" 
      name="pxVenteHT" 
      value=""
      placeholder="Prix de vente HT"
      title="" 
      pattern="[a-zA-Z]+"
    ><br>
    <label></label><input type="submit">
  </form>
</span>

<h3>Derniers pneus ajoutées</h3>
<table cellspacing="5">
  <tr>
      <th>Marque</th>
      <th>Nom</th>
      <th>Diamètre</th>
      <th>Structure</th>
      <th>Largeur</th>
      <th>Usage</th>
      <th>Charge</th>
      <th>Vitesse</th>
      <th>Achat HT</th>
      <th>Vente HT</th>
  </tr>
</table>