var multer  = require('multer');

   var storage = multer.diskStorage({
        destination: function (req, file, cb) {
          cb(null,  './public/attachments')
        },
        filename: function (req, file, cb) {
          var ext = require('path').extname(file.originalname);
          ext = ext.length>1 ? ext : "." + require('mime').extension(file.mimetype);
          require('crypto').pseudoRandomBytes(16, function (err, raw) {
            cb(null, (err ? undefined :file.fieldname + '-'+ raw.toString('hex') ) + ext);
          });
        }
      })
      var upload = multer({ storage: storage });
      //format for fields [{ name: 'nic', maxCount: 1 }]
    //   var cpUpload = upload.fields(req.body.fields);
 


module.exports = upload;