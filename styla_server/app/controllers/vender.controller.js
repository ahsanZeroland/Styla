const db = require("../models");

const Vender = db.vender;

exports.saveVender = async (req, res) => {

  const venders = new Vender({
      owner: req.user,
      name: req.body.name,
      location: req.body.location,
      description: req.body.description,
      imageurl: req.body.imageurl,
      created_at: new Date(),
  });
  console.log(venders);
  // const Admin = 'ROLE_ADMIN'
  // if (req.user.roles.find(x => x == Admin)) 
    venders.save((err, venders) => {
      if (err) {
        res.status(500).send({ message: err });
        return;
      }
     else { 
        venders.save(err => {
            if (err) {
              res.status(500).send({ message: err });
              return;
            }
            res.send({ message: "Vender Added Successfully!" });
          });
        };
    });  
  // else
  //   return res.send("Access is not granted to save vender")
}

// exports.getvender = async (req, res) =>{
//     try {
//         const products = await Product.find();
//         res.json(products);
//       } catch (err) {
//         res.status(500).json({ message: err.message });
//       }
// }
// exports.getonlyproduct = getProduct, async (req, res) =>{
//     res.json(res.product);
// }


// async function getProduct(req, res, next) {
//     let product;
//     try {
//       product = await Product.findById(req.params.id);
//       if (product == null) {
//         return res.status(404).json({ message: "cannot find Product" });
//       }
//     } catch (err) {
//       return res.status(500).json({ message: err.message });
//     }
//     res.product = product;
//     next();
//   }