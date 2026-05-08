require('dotenv').config();
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');
const morgan = require('morgan');
const rateLimit = require('express-rate-limit');
const http = require('http');
const { Server } = require('socket.io');

const connectDB = require('./src/config/database');
const logger = require('./src/config/logger');
const errorHandler = require('./src/middleware/errorHandler');

const app = express();
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: '*', methods: ['GET', 'POST'] } });

const PORT = process.env.PORT || 4000;

app.use(helmet());
app.use(cors({ origin: process.env.CORS_ORIGIN || '*', credentials: true }));
app.use(compression());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 200 }));

// Routes
app.use('/api/v1/auth',        require('./src/routes/auth'));
app.use('/api/v1/businesses',  require('./src/routes/businesses'));
app.use('/api/v1/jobs',        require('./src/routes/jobs'));
app.use('/api/v1/events',      require('./src/routes/events'));
app.use('/api/v1/hotels',      require('./src/routes/hotels'));
app.use('/api/v1/orders',      require('./src/routes/orders'));
app.use('/api/v1/food',        require('./src/routes/food'));
app.use('/api/v1/grocery',     require('./src/routes/grocery'));
app.use('/api/v1/pharmacy',    require('./src/routes/pharmacy'));
app.use('/api/v1/shopping',    require('./src/routes/shopping'));
app.use('/api/v1/transport',   require('./src/routes/transport'));
app.use('/api/v1/courier',     require('./src/routes/courier'));
app.use('/api/v1/logistics',   require('./src/routes/logistics'));
app.use('/api/v1/hospitals',   require('./src/routes/hospitals'));
app.use('/api/v1/govt',        require('./src/routes/govt'));
app.use('/api/v1/parks',       require('./src/routes/parks'));
app.use('/api/v1/real-estate', require('./src/routes/real_estate'));
app.use('/api/v1/amusement',   require('./src/routes/amusement'));
app.use('/api/v1/education',   require('./src/routes/education'));
app.use('/api/v1/emergency',   require('./src/routes/emergency'));
app.use('/api/v1/news',        require('./src/routes/news'));
app.use('/api/v1/tourism',     require('./src/routes/tourism'));
app.use('/api/v1/crafts',      require('./src/routes/crafts'));
app.use('/api/v1/water-gas',   require('./src/routes/water_gas'));
app.use('/api/v1/home-nursing',require('./src/routes/home_nursing'));

app.get('/health', (req, res) => res.json({ status: 'ok', app: 'Khyber Backend', port: PORT }));

app.use(errorHandler);

io.on('connection', (socket) => {
  logger.info('Socket connected: ' + socket.id);
  socket.on('disconnect', () => logger.info('Socket disconnected: ' + socket.id));
});

connectDB().then(() => {
  server.listen(PORT, () => logger.info(`Khyber Backend running on port ${PORT}`));
});
