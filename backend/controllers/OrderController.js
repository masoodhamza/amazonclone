const config = require("../dbconfig");
const sql = require("mssql");

const AddToCart = async (req, res) => {
  const { customerid, productid, quantity } = req.body;
  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC AddToCart ${customerid}, ${productid}, ${quantity}`;
        Request.query(Query)
          .then((data) => res.send(data.recordset))
          .catch((error) => console.log(error));
      })
      .catch((error) => console.log(error));
  } catch (error) {
    console.log(error);
  }
};

const RemoveFromCart = async (req, res) => {
  let { customerid, productid } = req.params;
  if (!productid) productid = 0;
  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC RemoveFromCart ${customerid}, ${productid}`;
        Request.query(Query)
          .then((data) => res.send(data.recordset))
          .catch((error) => console.log(error));
      })
      .catch((error) => console.log(error));
  } catch (error) {
    console.log(error);
  }
};

const Checkout = async (req, res) => {
  const { customerid } = req.params;
  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC Checkout ${customerid}`;
        Request.query(Query)
          .then((data) => res.send(data.recordset))
          .catch((error) => console.log(error));
      })
      .catch((error) => console.log(error));
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  AddToCart: AddToCart,
  RemoveFromCart: RemoveFromCart,
  Checkout: Checkout,
};
