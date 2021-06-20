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

const GetProducts = async (req, res) => {
  let { vendorid } = req.params;
  if (!vendorid) vendorid = 0;

  try {
    sql
      .connect(config)
      .then(() => {
        const Request = new sql.Request();
        const Query = `EXEC GetProducts ${vendorid}`;
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
  GetProducts: GetProducts,
};
