const db = require("../models");

const Product = db.product;
const Vendor = db.vender;
const Categ = db.category;

exports.saveproduct = async (req, res) => {

  let vendor = await Vendor.findById(req.body.vender);
  let categ = await Categ.findById(req.body.category);

  if (vendor && categ) {
    const product = new Product({
        title: req.body.title,
        category: categ,
        productCode: req.body.productCode,
        colors:req.body.colors,
        sizes: req.body.sizes,
        quantity: req.body.quantity,
        description: req.body.description,
        vender: vendor,
        created_at: new Date(),
    });
    console.log(product);
    const Admin = 'ROLE_ADMIN'
    const vender = 'ROLE_VENDER'
    if (req.user.roles.find(x=>x == vender) || req.user.roles.find(x => x == Admin)) {
      product.save((err, product) => {
        if (err) {
          res.status(500).send({ message: err });
          return;
        }
       else { 
          product.save(err => {
              if (err) {
                res.status(500).send({ message: err });
                return;
              }
              res.send({ message: "Product Added Successfully!" });
            });
          };
      });  
    }
    else{
      return res.send("Access is not granted to save product")
    }
  } else {
    res.send({ message: "Product can't add no vendor or category with found id!" });
  }
}

exports.getproducts = async (req, res) =>{
    try {
        const products = await Product.find()
        .populate('category').populate('vender');
        res.json(products);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
}
exports.getproductName = async (req, res) =>{
  try {
      const products = await Product.find().select('title description -_id').populate('category','vender');
      console.log(products);
      res.json(products);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
}
exports.getproductDetail = getProduct, async (req, res) =>{
    res.json(res.product);
}


async function getProduct(req, res, next) {
    let product;
    try {
      product = await Product.findById(req.params.id);
      if (product == null) {
        return res.status(404).json({ message: "cannot find Product" });
      }
    } catch (err) {
      return res.status(500).json({ message: err.message });
    }
    res.product = product;
    next();
  }