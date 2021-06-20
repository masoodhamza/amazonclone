const config = require("../dbconfig");
const sql = require("mssql");

const AddProduct = async (req, res) => {
  const { vendorid, name, description, price, quantity } = req.body;
  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC AddProduct ${vendorid}, '${name}', '${description}', '${price}', '${quantity}'`;
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
  AddProduct: AddProduct,
};
