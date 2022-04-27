from sql_helper import SQLHelper

FACT_DDL = "FactDDL.sql"
FACT_DML = "FactDML.sql"
DIM_DDL = "DIMDDL.sql"
DIM_DML = "DIMDML.sql"
CREDENTIAL = "creds.json"


def create_and_populate_fact(sql_handler):
    sql_handler.execute_query_from_file(FACT_DDL)
    sql_handler.execute_query_from_file(FACT_DML)


def create_and_populate_dim(sql_handler):
    sql_handler.execute_query_from_file(DIM_DDL)
    sql_handler.execute_query_from_file(DIM_DML)


if __name__ == "__main__":
    sql_handler = SQLHelper(CREDENTIAL)
    create_and_populate_fact(sql_handler)
    create_and_populate_dim(sql_handler)
