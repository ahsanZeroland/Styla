const db = require("../models")

const Category = db.category;

exports.savecategory = async (req, res) => {
  console.log('hy')
    const category = new Category({
        title:req.body.title,
        imageurl: req.body.imageurl,
        subcategories: req.body.subcategories
      
    })
    console.log(category),
    category.save((err, categ) => {
        if (err) {
          res.status(500).send({ message: err });
          return;
        }
       else { 
        categ.save(err => {
              if (err) {
                res.status(500).send({ message: err });
                return;
              }
              res.send({ message: "Category Added Successfully!" });
            });
          };
      });
}
exports.getcategorys = async (req, res) =>{
    try {
        const categories = await Category.find();
        res.json(categories);
      } catch (err) {
        res.status(500).json({ message: err.message });
      }
}

exports.getonlycategory = getCategory, async (req, res) =>{
    res.json(res.category);
}


async function getCategory(req, res, next) {
    let category;
    try {
      category = await Category.findById(req.params.id);
      if (category == null) {
        return res.status(404).json({ message: "cannot find Category" });
      }
    } catch (err) {
      return res.status(500).json({ message: err.message });
    }
    res.category = category;
    next();
  }