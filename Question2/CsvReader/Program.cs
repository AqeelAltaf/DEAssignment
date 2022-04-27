using Microsoft.VisualBasic.FileIO;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;

namespace CsvReader
{
    public class Program
    {
        private readonly static string inputFolderName = ConfigurationSettings.AppSettings["InputFolderName"];
        private readonly static string errorFolderName = ConfigurationSettings.AppSettings["ErrorFolderName"];
        private readonly static string csvDelimeter = ConfigurationSettings.AppSettings["CsvDelimeter"];
        private readonly static string basedir = @"C:\Users\aqeel.altaf\Desktop\Data Engineering Assessment\Solution\Question2";

        static void Main(string[] args)
        {
            List<string> lst = ReadCsvFiles();
            MoveErrorFiles(lst);
        }

        public static List<string> ReadCsvFiles()
        {
            List<string> listErrorFileNames = new();
            string errorFileNames = string.Empty;
            try
            {
                Datalayer dt = new();
                int dtCsvCount = 1;
                DataSet csvDataSet = new();
                StringBuilder inputFolderPath = new();


                inputFolderPath.Append(basedir);
                inputFolderPath.Append("\\");
                inputFolderPath.Append(inputFolderName);

                if (Directory.EnumerateFiles(inputFolderPath.ToString(), "*.csv").Any())
                {
                    foreach (string file in Directory.EnumerateFiles(inputFolderPath.ToString(), "*.csv"))
                    {
                        errorFileNames = file;
                        bool headerRow = true;
                        DataTable dtCsv = csvDataSet.Tables.Add("dtCsv" + dtCsvCount);

                        dtCsvCount++;
                        using (TextFieldParser parser = new TextFieldParser(file))
                        {
                            parser.TextFieldType = FieldType.Delimited;
                            parser.SetDelimiters(csvDelimeter);
                            while (!parser.EndOfData)
                            {
                                //Header row
                                if (headerRow)
                                {
                                    headerRow = false;
                                    string[] fields = parser.ReadFields();
                                    foreach (string field in fields)
                                    {
                                        dtCsv.Columns.Add(field, field.GetType());
                                    }
                                    continue;
                                }
                                else
                                {
                                    //Data row
                                    object[] currentLine = parser.ReadFields();
                                    dtCsv.Rows.Add(currentLine);
                                }

                            }
                        }
                    }
                    dt.AddBaseProject(csvDataSet);
                }
                else
                {
                    Console.WriteLine("There is no .csv file as an input ..");
                }
            }
            catch (Exception ex)
            {
                listErrorFileNames.Add(errorFileNames);
                Console.WriteLine($"Exception ReadCsvFiles Message : {ex}, Exception ReadCsvFiles : {ex}");
            }

            return listErrorFileNames;
        }

        public static void MoveErrorFiles(List<string> errorFiles)
        {
            if (errorFiles.Any())
            {
                foreach (string errorFile in errorFiles)
                {
                    StringBuilder outputFolderPath = new StringBuilder();

                    outputFolderPath.Append(basedir);
                    outputFolderPath.Append("\\");
                    outputFolderPath.Append(errorFolderName);

                    if (!Directory.Exists(outputFolderPath.ToString()))
                    {
                        Directory.CreateDirectory(outputFolderPath.ToString());
                        File.Move(errorFile, outputFolderPath.ToString());
                    }
                    else
                    {
                        File.Move(errorFile, outputFolderPath.ToString());
                    }
                }
            }

        }
    }
}
