const jwt = require('jsonwebtoken');
function token(user) { return jwt.sign({ id: user.id, role: user.role, name: user.name }, process.env.JWT_SECRET, { expiresIn: '7d' }); }
function required(req, res, next) { try { req.user = jwt.verify(req.cookies.token || '', process.env.JWT_SECRET); next(); } catch { res.status(401).json({ error: 'Silakan masuk terlebih dahulu' }); } }
function admin(req, res, next) { if (req.user?.role === 'admin') return next(); res.status(403).json({ error: 'Akses khusus admin' }); }
function safe(s, max = 255) { return String(s || '').trim().replace(/[<>]/g, '').slice(0, max); }
module.exports = { token, required, admin, safe };
