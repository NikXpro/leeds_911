const mysql = require("mysql2")

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "leeds_911"
})



function performCallback(callback, ...args) {
    setImmediate(() => {
        callback(...args)
    })
}

//* SELECT * FROM users WHERE id = @id && age = @age && name = @name
//* {id, age, name}

connection.config.queryFormat = function (query, values) {
    if (!values) return query;
    return query.replace(/\@(\w+)/g, function (txt, key) {
        if (values.hasOwnProperty(key)) return this.escape(values[key]);
        return txt;
    }.bind(this));
};

global.exports("mysql_execute", (query, parameters = {}, callback) => {
    if (typeof parameters === "function") {
        callback = parameters
        parameters = {}
    }

    connection.promise().query(query, parameters)
        .then(([results]) => {
            if (typeof callback === "function") performCallback(callback, results)
            return true
        })
        .catch((e) => { console.log(e); return [] })
})
