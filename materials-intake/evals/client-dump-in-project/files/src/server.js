const fs = require('fs');
const path = require('path');

// Delivery zones are loaded at startup; the file is part of the app.
const zones = fs.readFileSync(path.join(__dirname, '..', 'config', 'delivery-zones.csv'), 'utf8');
console.log(`Loaded ${zones.trim().split('\n').length - 1} delivery zones`);
