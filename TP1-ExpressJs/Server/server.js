const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');

const app = express();
const port = 4000;

app.use(bodyParser.json());

// Charger les données depuis data.json
const loadData = () => {
  try {
    const data = fs.readFileSync('data.json', 'utf8');
    return JSON.parse(data);
  } catch (error) {
    return { products: [], orders: [] }; // Renvoie un JSON vide si le fichier n'existe pas
  }
};

// Sauvegarder les données dans data.json
const saveData = (data) => {
  fs.writeFileSync('data.json', JSON.stringify(data, null, 2));
};

// Vérifier si le serveur fonctionne
app.get('/', (req, res) => {
  res.send('API Backend fonctionne!');
});

app.listen(port, () => {
  console.log(`Serveur API démarré sur http://localhost:${port}`);
});

// Récupérer tous les produits
app.get('/products', (req, res) => {
  const data = loadData();
  res.json(data.products);
});

// Ajouter un produit
app.post('/products', (req, res) => {
  const data = loadData();
  const newProduct = req.body;
  data.products.push(newProduct);
  saveData(data);
  res.status(201).send('Produit ajouté avec succès');
});

// Récupérer toutes les commandes
app.get('/orders', (req, res) => {
  const data = loadData();
  res.json(data.orders);
});

// Ajouter une commande
app.post('/orders', (req, res) => {
  const data = loadData();
  const newOrder = req.body;
  data.orders.push(newOrder);
  saveData(data);
  res.status(201).send('Commande créée avec succès');
});
