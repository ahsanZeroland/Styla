const jwt = require('jsonwebtoken');
const config = require('../config/auth.config');
module.exports=function(req,res,next) {
    const token = req.header('auth-token');
    if (!token) {
        return res.status(401).send('ACESS DENIED')
    }
    try {
        const verified = jwt.verify(token,config.secret)
        req.user = verified;
        next();
    } catch (error) {
        res.status(400).send('Invalid Token')
    }
}