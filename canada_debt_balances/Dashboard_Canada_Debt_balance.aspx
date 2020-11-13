<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_Canada_Debt_balance.aspx.cs" Inherits="canada_debt_balances.Dashboard_Canada_Debt_balance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/
    </style>

    <script type="text/javascript">

        var idArray = [];

        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }

        function FileNameInputPrompt() {

          //  alert("test");

            var inputfilename = prompt("Please Enter Save Name", "filename1");
            if (inputfilename != null) {
                this.fileName = inputfilename;

                let csvContent = "data:text/csv;charset=utf-8,";




                var i;
                for (i = 0; i < idArray.length; i++) {

                    if (idArray[i].split("_")[1] == "0") { continue; }

                    var valuev = document.getElementById(idArray[i]).value;

                    var rowValue = idArray[i] + "^" + valuev;

                    //alert(rowValue);

                    csvContent += rowValue + "\r\n";
                }




                var downloadFile = inputfilename + ".csv";

                var encodedUri = encodeURI(csvContent);
                var link = document.createElement("a");
                link.setAttribute("href", encodedUri);
                link.setAttribute("download", downloadFile);
                document.body.appendChild(link); // Required for FF

                link.click();
            }



        }


        function getCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }

        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        function removeCommas(x) {

            var total = parseFloat(x.replace(/,/g, ''));


            if (isNaN(total)) {
                return 0;
            }
            else {
                return total;
            }
        }




        function myFunction() {


            var both = this.id.split("_");
            var row = both[0];
            var col = both[1];


            if (row == "0" && col == "1") {

                return;
            }

            if (row == 11) {

                var reflectedCol = Number(col) + Number(1);

                var val1 = document.getElementById("11" + "_" + col).value;
                document.getElementById("6" + "_" + reflectedCol).value = numberWithCommas(val1);
                // setCookie("6" + "_" + reflectedCol, val1, 100);

            }


            if (row == 6 || row == 7 || row == 8) {

                var val1 = document.getElementById("6" + "_" + col).value;

                var val2 = document.getElementById("7" + "_" + col).value;

                var val3 = document.getElementById("8" + "_" + col).value;




                var sum = Number(removeCommas(val1)) - Number(removeCommas(val2)) - Number(removeCommas(val3));

                document.getElementById("9" + "_" + col).value = numberWithCommas(sum);
                //setCookie("9" + "_" + col, sum, 100);
            }


            if (row == 9 || row == 10) {
                var val1 = document.getElementById("9" + "_" + col).value;

                var val2 = document.getElementById("10" + "_" + col).value;

                var sum = Number(removeCommas(val1)) + Number(removeCommas(val2));

                document.getElementById("11" + "_" + col).value = numberWithCommas(sum);
                //setCookie("11" + "_" + col, sum, 100);

                var nextcol = Number(col) + Number(1);

                document.getElementById("6" + "_" + nextcol).value = numberWithCommas(sum);
                // setCookie("6" + "_" + nextcol, sum, 100);



                var col2 = Number(col) - Number(1);

                var previous_tot_canada = document.getElementById("11" + "_" + col2).value;

                var sum2 = Number(removeCommas(previous_tot_canada)) - sum;

                document.getElementById("12" + "_" + col).value = numberWithCommas(sum2);
                //setCookie("12" + "_" + col, sum2, 100);

            }


            if (row == 11 || row == 13 || row == 14) {

                //values of each cell

                var val1 = document.getElementById("11" + "_" + col).value;
                //  alert(val1);
                var val2 = document.getElementById("13" + "_" + col).value;
                //   alert(val2);
                var val3 = document.getElementById("14" + "_" + col).value;
                //  alert(val3);




                var sum = Number(removeCommas(val1)) + Number(removeCommas(val2)) + Number(removeCommas(val3));
                //  alert(sum);

                document.getElementById("15" + "_" + col).value = numberWithCommas(sum);
                // setCookie("15" + "_" + col, sum, 100);

            }

            if (row == 17 || row == 18 || row == 19 || row == 20) {

                var val1 = document.getElementById("17" + "_" + col).value;
                var val2 = document.getElementById("18" + "_" + col).value;
                var val3 = document.getElementById("19" + "_" + col).value;
                var val4 = document.getElementById("20" + "_" + col).value;

                var sum = Number(removeCommas(val1)) + Number(removeCommas(val2)) + Number(removeCommas(val3)) + Number(removeCommas(val4));

                var nextCol = Number(col) + Number(1);

                document.getElementById("21" + "_" + col).value = numberWithCommas(sum);
                //setCookie("21" + "_" + col, sum, 100);


                document.getElementById("17" + "_" + nextCol).value = numberWithCommas(sum);
                //setCookie("17" + "_" + nextCol, sum, 100);

                var top = document.getElementById("15" + "_" + col).value;

               var topWithoutComma = removeCommas(top);

                var Total_Debt_Equity_ratio = Number(topWithoutComma) / Number(sum);



                document.getElementById("23" + "_" + col).value = Total_Debt_Equity_ratio.toFixed(2);

            }





            //update avarages

            //
            for (var i = 0, row; row = table.rows[i]; i++) {

                if (i != 6 && i != 11 && i != 15 && i != 21 ) { continue; }


                var sum_avg = 0;

                for (var j = 0, col; col = row.cells[j]; j++) {

                    if (j == 0) { continue; }

                    var t = col.children[0];


                    if (j != 14) {

                        sum_avg = Number(sum_avg) + Number(removeCommas(t.value));
                    }
                    else {

                        sum_avg = Number(sum_avg) / Number(13);

                        t.value = Math.trunc(sum_avg);
                        // setCookie()
                    }



                }
            }



            setCookie(this.id, this.value, 100);

            this.value = numberWithCommas(this.value);
        }

        function readSingleFile(e) {
            var file = e.target.files[0];
            if (!file) {
                return;
            }
            var reader = new FileReader();
            reader.onload = function (e) {
                var contents = e.target.result;
                displayContents(contents);
            };
            reader.readAsText(file);
        }

        function displayContents(contents) {
            var arr = contents.split(/\r?\n/);

           // alert(arr.length);

            var i;
            for (i = 0; i < arr.length; i++) {
                var line = arr[i]
                var id = line.split("^")[0];
                var value = line.split("^")[1];

                document.getElementById(id).value = value;
            }

        }

        function printDiv() {
            var divContents = document.getElementById("div_table").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body >');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }

        function clearButtonClicked() {

            location.reload();
        }

    </script>

</head>
<body style="font-family: Arial, Helvetica, sans-serif">
    <form id="form1" runat="server">
        <div>
            <div id="div_buttons" style="padding:20px;text-align:center">
                <input id="Button1" type="button" value="Clear" onclick="clearButtonClicked()" />
                <input id="Button3" type="button" value="Save" onclick="FileNameInputPrompt()" />
                <input id="Button2" type="button" value="Print Preview" onclick="printDiv()" />
                <input type="file" id="file-input" />
            </div>

            <div id="div_table">
                <table id="dashboard_table">
                    <tr>
                        <td>
                            <input type="text"  />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td colspan="5"><input type="text" style="font-weight:700" value="TOTAL DEBT - 3 YEAR PLAN 2007 - 2009" /></td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td>
                            <input type="text"  />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Type -->
                    <tr>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <select>
                                <option>Forecast</option>
                                <option>Budget</option>
                                <option>Actual</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" />
                        </td>

                    </tr>
                    <!-- Month -->
                    <tr>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input value="Dec (PY)" type="text" />
                        </td>
                        <td>
                            <input value="Jan" type="text" />
                        </td>
                        <td>
                            <input value="Feb" type="text" />
                        </td>
                        <td>
                            <input value="Mar" type="text" />
                        </td>
                        <td>
                            <input value="Apr" type="text" />
                        </td>
                        <td>
                            <input value="May" type="text" />
                        </td>
                        <td>
                            <input value="Jun" type="text" />
                        </td>
                        <td>
                            <input value="Jul" type="text" />
                        </td>
                        <td>
                            <input value="Aug" type="text" />
                        </td>
                        <td>
                            <input value="Sep" type="text" />
                        </td>
                        <td>
                            <input value="Oct" type="text" />
                        </td>
                        <td>
                            <input value="Nov" type="text" />
                        </td>
                        <td>
                            <input value="Dec" type="text" />
                        </td>
                        <td>
                            <input value="Mth Avg" type="text" />
                        </td>

                    </tr>
                    <!-- Canda -->
                    <tr>
                        <td>
                            <input type="text" style="font-weight: 700" value="CANADA" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Beginning Debt -->
                    <tr>
                        <td>
                            <input type="text" value="Beginning Debt" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Monthly Cash In / (Out) Flow -->
                    <tr>
                        <td>
                            <input type="text" value="Monthly Cash In / (Out) Flow" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Reversal of Payables Holdback -->
                    <tr>
                        <td>
                            <input type="text" value="Reversal of Payables Holdback" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Ending Debt-->
                    <tr>
                        <td>
                            <input type="text" value="Ending Debt" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Increase (decrease) debt -->
                    <tr>
                        <td>
                            <input type="text" value="Increase (decrease) debt" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Total Canada -->
                    <tr>
                        <td>
                            <input type="text" style="font-weight: 700" value="Total Canada" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Net mothly loan reduction -->
                    <tr>
                        <td>
                            <input type="text" value="Net mothly loan reduction" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Mortgages -->
                    <tr>
                        <td>
                            <input type="text" value="Mortgages" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Reserve for Non Completion -->
                    <tr>
                        <td>
                            <input type="text" value="Reserve for Non Completion" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Total Consol Debt (1) -->
                    <tr>
                        <td>
                            <input type="text" style="font-weight: 700" value="Total Consol Debt (1)" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- EQUITY -->
                    <tr>
                        <td>
                            <input type="text" style="font-weight: 700" value="EQUITY" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Beginning -->
                    <tr>
                        <td>
                            <input type="text" value="Beginning" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Increase (decrease) earnings -->
                    <tr>
                        <td>
                            <input type="text" value="Increase (decrease) earnings" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Dividend -->
                    <tr>
                        <td>
                            <input type="text" value="Dividend" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Share subscription / (redemption)-->
                    <tr>
                        <td>
                            <input type="text" value="Share subscription / (redemption)" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- ENDING -->
                    <tr>
                        <td>
                            <input type="text" value="ENDING" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- On Balance Sheet : Debt / Equity ratio-->
                    <tr>
                        <td>
                            <input type="text" value="On Balance Sheet : Debt / Equity ratio" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                    <!-- Total Debt / Equity ratio-->
                    <tr>
                        <td>
                            <input type="text" value="Total Debt / Equity ratio" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                        <td>
                            <input type="text" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>

    <script>

        
        var table = document.getElementById("dashboard_table");

        document.getElementById('file-input')
            .addEventListener('change', readSingleFile, false);

        for (var i = 0, row; row = table.rows[i]; i++) {
            for (var j = 0, col; col = row.cells[j]; j++) {


                //adding a bottom line 
                if (i == 4 || i == 10 || i == 14 || i == 20 || i == 23) { col.style.borderBottom = "1px solid #000000"; }


                //adding bottomline and ashes color as the background
                if (i == 11 || i == 15 || i == 21) {
                    col.style.borderBottom = "1px double #000000";
                    col.style.backgroundColor = "#dddddd";
                }




                try {

                    var t = col.children[0];
                    t.readOnly = true;
                    t.addEventListener('change', myFunction, false);
                    t.style.border = "none";
                    t.style.textAlign = "right";

                    if (i == 4) {

                        t.style.textAlign = "center";
                    }


                    if (i == 11 || i == 15 || i == 21) {
                        t.style.backgroundColor = "#dddddd";
                    }



                    if (j != 0) { col.style.width = "100px"; }
                    else if (j == 0 && i == 0)
                    {
                        col.style.width = "500px";
                    }
                    else {
                        col.style.width = "250px";
                    }

                    //if (i % 2 == 0) {

                    //    t.style.backgroundColor = "#FDF9F8";
                    //}

                    var currentID = i + "_" + j;
                    idArray.push(currentID);

                    t.id = currentID;
                    if (j != 0) { t.style.width = "100px"; }
                    else {
                        t.style.width = "270px";
                        t.style.textAlign = "left";
                    }

                    //check and set cookie value to this text input

                    //if (!t.value) {
                    //    var v = getCookie(t.id);
                    //    t.value = v;
                    //}

                }
                catch (err) {

                }


            }
        }

        for (var i = 0, row; row = table.rows[i]; i++) {
            for (var j = 0, col; col = row.cells[j]; j++) {
                if (i == 7) {
                    if (j != 0 && j != 1 && j != 14) {

                        var t = col.children[0];
                        t.readOnly = false;
                    }
                }

                if (i == 8) {
                    if (j != 0 && j != 1 && j != 14) {

                        var t = col.children[0];
                        t.readOnly = false;
                    }
                }

                if (i == 10) {
                    if (j != 0 && j != 1 && j != 14) {

                        var t = col.children[0];
                        t.readOnly = false;
                    }
                }

                if (i == 11 && j == 1) {

                    var t = col.children[0];
                    t.readOnly = false;
                }

                if (i == 13) {
                    if (j != 14 && j != 0) {
                        var t = col.children[0];
                        t.readOnly = false;

                    }

                }

                if (i == 14) {
                    if (j != 14 && j != 0) {
                        var t = col.children[0];
                        t.readOnly = false;

                    }

                }

                if (i > 16 && i < 21) {
                    if (j != 14 && j != 0) {
                        var t = col.children[0];
                        t.readOnly = false;

                    }

                }

                if (i == 22) {
                    if (j != 14 && j != 0) {
                        var t = col.children[0];
                        t.readOnly = false;

                    }

                }

            }
        }

        document.getElementById("0_0").readOnly = false;

        document.getElementById("0_0").width = "500px";

    </script>

</body>
</html>
