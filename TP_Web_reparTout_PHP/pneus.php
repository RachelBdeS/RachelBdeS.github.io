<h2 id="welcome">Pneus
  <button class="edit" onclick="showSpan('editForm');" title="">+</button>
</h2>
<p>Voici les pneus.</p>

<span id="editForm">
  <h3>Ajouter un pneu</h3>
  <form action="" method="GET" name="ajout">
    <label for="nom">Marque</label>
    <input 
      type="text" 
      id="nom" name="nom" 
      placeholder="Nom"
      title=""
      pattern="[a-zA-Z0-9\s]+"
      value="" 
    ><br>
    <label for="nom">Nom</label>
    <input 
      type="text" 
      id="marque" name="marque" 
      placeholder="Marque"
      title=""
      pattern="[a-zA-Z0-9\s]+"
      value="" 
    ><br>
    
    <label for="desc">Diamètre</label>
    <input 
      type="number" 
      id="diametre" name="diametre" 
      placeholder="Diamètre"
      title=""
      value=""
    ><br>

    <label for="desc">Structure</label>
    <input 
      type="text" 
      id="structure" name="structure" 
      placeholder="Structure"
      title=""
      pattern="[a-zA-Z]+"
      value=""
    ><br>

    <label for="desc">Largeur</label>
    <input 
      type="text" 
      id="largeur" name="largeur" 
      placeholder="Largeur"
      title=""
      pattern="[a-zA-Z]+"
      value=""
    ><br>

    <label for="desc">Usage</label>
    <input 
      type="text" 
      id="usage" name="usage" 
      placeholder="Usage"
      title=""
      pattern="[a-zA-Z]+"
      value=""
    ><br>

    <label for="desc">Indice de charge</label>
    <input 
      type="number" 
      id="charge" name="charge" 
      placeholder="Indice de charge"
      title=""
      value=""
      min="" max="" 
      step="1" 
    ><br>

    <label for="desc">Indice de vitesse</label>
    <input 
      type="number" 
      id="vitesse" name="vitesse" 
      placeholder="Indice de vitesse"
      title=""
      value=""
      min="" max="" 
      step="1" 
    ><br>

    <label for="desc">Prix d'achat HT</label>
    <input 
      type="number" 
      id="pxAchatHT" name="pxAchatHT" 
      placeholder="Prix d'achat HT"
      title=""
      value=""
      min="" max="" 
      step="1" 
    ><br>

    <label for="desc">Prix de vente HT</label>
    <input 
      type="number" 
      id="pxVenteHT" name="pxVenteHT" 
      placeholder="Prix de vente HT"
      title="" 
      value=""
      min="" max="" 
      step="1" 
    ><br>

    <label></label>
    <select id="id_fournisseur">
      <option value="1">Fournisseur 1</option>
      <option value="2">Fournisseur 2</option>
    </select><br>

    <label></label>
    <input type="submit" value="Envoyer">
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
      <th>Fournisseur</th>
  </tr>
</table>