const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Routes
app.get('/', (req, res) => {
    res.send("Server chal raha hai staging");
});

app.get('/api', (req, res) => {
    res.json({
        message: "API working on api endpoint staging",
        status: true
    });
});

app.get('/api/data', (req, res) => { 
    const data = req.body;

    res.json({
        message: "Data mil gaya 👍 staging",
        receivedData: data
    });
});

// 404 Handler
app.use((req, res) => {
    res.status(404).json({ message: "Route nahi mila ❌" });
});

// Server Start
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});