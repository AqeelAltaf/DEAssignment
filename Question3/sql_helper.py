import pyodbc
import json


class SQLHelper:
    def __init__(self, creds_file_path):
        self.creds_file_path = creds_file_path
        self.set_conn_string()

    def set_conn_string(self):
        with open(self.creds_file_path) as f:
            creds = json.load(f)
            self.conn_string = f'DRIVER={{SQL Server}};SERVER={creds["server"]};DATABASE={creds["database"]};UID={creds["username"]};PWD={creds["password"]};'

    def create_connection(self):
        try:
            conn = pyodbc.connect(self.conn_string)
            return conn
        except pyodbc.Error as ex:
            print(f"Connection failed")
            raise ex

    def execute_query(self, query):
        conn = self.create_connection()
        cursor = conn.cursor()
        cursor.execute(query)
        cursor.commit()
        cursor.close()
        conn.close()

    def execute_query_from_file(self, filename):

        with open(filename, "r") as f:
            lines = f.readlines()
        query = "\n".join(lines)
        self.execute_query(query)
