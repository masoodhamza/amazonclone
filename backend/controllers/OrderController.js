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

module.exports = {
  AddToCart: AddToCart,
};
