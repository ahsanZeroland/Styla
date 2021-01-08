const { vender } = require("../models");
const db = require("../models");

const imageMimeTypes = ['image/jpeg', 'image/png', 'images/gif']

const Slider = db.slider;
const Vender = db.vender;

exports.saveSlider = async (req, res) => {
    
    let vendor = await Vender.findById(req.body.vender);
    if(vender){
        const sliders = new Slider({
        title: req.body.title,
        vender: vendor,
        created_at: new Date(),
        expiration: new Date(req.body.expiration),
    });
    saveSliders(sliders, req.body.slider)

    console.log(sliders);
    const Admin = 'ROLE_ADMIN'
        if (req.user.roles.find(x => x == Admin)) {
            sliders.save((err, sliders) => {
            if (err) {
                res.status(500).send({ message: err });
                return;
            }
            else { 
                sliders.save(err => {
                    if (err) {
                        res.status(500).send({ message: err });
                        return;
                    }
                    res.send({ message: "slider added" });
                });
                };
            });  
        }   
        else{
            return res.send("Access is not granted to save slider");
        }
    }else{
        res.send({ message: "slider can't add no vender with found id!" });
    }
}

function saveSliders(sliders, sliderEncoded) {
    if (sliderEncoded == null) return
    const slider = JSON.parse(sliderEncoded)
    if (slider != null && imageMimeTypes.includes(slider.type)) {
      sliders.sliderImage = new Buffer.from(slider.data, 'base64')
      sliders.sliderImageType = slider.type
    }
  }