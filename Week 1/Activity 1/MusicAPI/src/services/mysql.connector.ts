import { createPool, Pool } from 'mysql';
let pool: Pool | null = null;

const initializeMySqlConnector = () =>{
    try{
        pool = createPool({
            connectionLimit:
                parseInt(process.env.MY_SQL_DB_CONNECTION_LIMIT != undefined ? process.env.MY_SQL_DB_CONNECTION_LIMIT : ""),
            port:
                parseInt(process.env.MY_SQL_DB_PORT != undefined ? process.env.MY_SQL_DB_PORT : ""),
            host: process.env.MY_SQL_DB_HOST,
            user: process.env.MY_SQL_DB_USER,
            password: process.env.MY_SQL_DB_PASSWORD,
            database: process.env.MY_SQL_DB_DATABASE
        });

        console.debug("MySQL Adapter Pool generated sucessfully");
        console.log("process.env.DB_DATABASE", process.env.MY_SQL_DB_DATABASE);

        pool.getConnection((err, connection)=>{
            if(err){
                console.log("Error mysql failed to connect", err);
                throw new Error("not able to connect database");
            }else{
                console.log("connection made");
                connection.release();
            }
        });
    } catch(error){
        console.error("[mysql.connector][initalizeMySQLConnector][Error]: ", error);
        throw new Error('failed to initalize pool');
    }
};

export const execute = <T>(query: string, params: string[] | Object): Promise<T> =>{
    try{
        if(!pool){
            initializeMySqlConnector();
        }

        return new Promise<T>((resolve, reject)=>{
            pool!.query(query, params, (error, results)=>{
                if(error) reject(error);
                else resolve(results);
            });
        });
    } catch(error){
        console.error('[mysql.connnector][execute][Error]: ', error);
        throw new Error('failed to execute MySQL query');
    }
}