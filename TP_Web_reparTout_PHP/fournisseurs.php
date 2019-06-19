<h2 id="welcome">Fournisseurs
  <button class="edit" onclick="showSpan('editForm');" title="">+</button>
</h2>
<p>Voici les fournisseurs.</p>

<span id="editForm">
  <h3>Ajouter un fournisseur</h3>
  <form action="" method="POST" name="ajout">   
    <input type="hidden" id="numerof" name="numerof" value="" pattern="[0-9]+" readonly><br> <!-- TEMP - Numéro du fournisseur (en attendant la lisaison avec la BDD qui fournira ce numéro -->
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
    <label></label> <input type="submit" id="btnSubmit" value="Envoyer">
  </form>
</span>

<h3>Dernièrs fournisseurs ajoutés</h3>
<table cellspacing="5">
  <tr>
    <th>Numéro</th>
    <th>Nom</th>
    <th>Téléphone</th>
    <th>Adresse</th>
  </tr>
</table>

