// var Consignee = require('../models/consignee.model');
// var Order = require('../models/order.model');
// var Lead = require('../models/lead.model');
// const Mailer = require('../service/mailer');
// var Consignee = require('../models/consignee.model');
// var ContactPerson = require('../models/contactperson.model');
// var Pickup = require('../models/pickup.model');
// var Shipper = require('../models/shipper.model');
// var OrderStatus = require('../models/orderStatus.model');
// var CounterPart =  require('../models/counterpart.model');
// const customError = require('../models/customError.model');
// const { check,validationResult } = require('express-validator');//An express.js middleware for validator
// const consigneeController  =  require('./consignee.controller');
// let agenda = require('../jobs/agenda');
// const SendMail = require('../models/send-mail.model');
// var ObjectId = require('mongodb').ObjectID;

// exports.addOrder = [
//     check('contentDescription', 'name is required').not().isEmpty(), async(req,res,next) => {

//         let createdDate = new Date().getTime();
        
//         var order = new Order();
//         var lead = new Lead();
//         var consignee  = new Consignee();
//         var addcontact = new ContactPerson();
//         var orderStatus = new OrderStatus();

//         console.log(req.body);

//         lead.contentDescription = req.body.lead[0].contentDescription;
//         lead.quotation = req.body.lead[0].quotation;
//         lead.contentWeight = req.body.lead[0].contentWeight;
//         lead.dimensions = req.body.lead[0].dimensions;
//         lead.origin = req.body.lead[0].origin;
//         lead.destination = req.body.lead[0].destination;
//         lead.clearanceCharges = req.body.lead[0].clearanceCharges;
//         lead.clearanceInstructions = req.body.lead[0].clearanceInstructions;

//       /*  addcontact.firstname = req.body.consignee[0].addContact.firstname;
//         addcontact.lastname = req.body.consignee[0].addContact.lastname;
//         addcontact.createdDate = req.body.consignee[0].addContact.createdDate;
//         addcontact.emailaddress = req.body.consignee[0].addContact.emailaddress;
//         addcontact.phoneNumber = req.body.consignee[0].addContact.phoneNumber;
//         addcontact.address = req.body.consignee[0].addContact.address;
//         addcontact.city  = req.body.consignee[0].addContact.city;
//         addcontact.country = req.body.consignee[0].addContact.country;
       
//         consignee.addContact.push(addcontact);*/
//         consignee.companyID =  req.body.consignee[0].companyID;
//         consignee.companyName = req.body.consignee[0].companyName;
//         consignee.companyAddress = req.body.consignee[0].companyAddress;
//         consignee.companyEmail = req.body.consignee[0].companyEmail;
//         consignee.companyPhone = req.body.consignee[0].companyPhone;
//         consignee.addContact = req.body.consignee[0].addContact;
//         consignee.saleperson = req.body.consignee[0].saleperson;

//         orderStatus.state = 'Pending';
//         orderStatus.status = 'Pending Inquiry';
//         orderStatus.createdDate =req.body.createdDate;
//         orderStatus.createdBy =req.user.firstName+" "+req.user.lastName;
      
//         order.lead.push(lead);
//         order.consignee.push(consignee);
//         order.orderStatus.push(orderStatus);
//         order.status = '1';