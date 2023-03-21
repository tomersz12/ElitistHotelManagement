// https://www.youtube.com/watch?v=fPuLnzSjPLE (tutorial i used to create connection)
// https://github.com/mysqljs/mysql/issues/1166 (helped solve a connection issue)

// importing the usage of mysql into the website
import express from "express"
import mysql from "mysql"

const app = express() //creates instance of app

//creates the connection to the sql file
const mainDataBase = mysql.createPool({
    host:"localhost",
    user:"root",
    password:"juswan07",
    database:"test"
})


app.get("/", (request,response) => {
    response.json("Hello this is backend")
})

// Talks to the SQL DB and gives it queries to run
app.get("/books", (request,response) =>{
    const query1 = "SELECT * FROM test.books" //query to test
    mainDataBase.query(query1, (err,data)=>{ //calling the query
        if (err) return response.json(err) //error handler incase error is thrown
        return response.json(data) //if the query runs, the response is thrown
    })
})

// listen to port number 8800
// port number represents where the localhost should see
app.listen(8800, ()=>{
    console.log("Connected!")
})
