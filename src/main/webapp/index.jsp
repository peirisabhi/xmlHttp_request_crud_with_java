<%-- 
    Document   : index
    Created on : May 23, 2021, 9:09:29 AM
    Author     : abhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

        <title>Web EE Cooding Exam!</title>
    </head>
    <body onload="inti();">
        <h1 class="text-center mt-5">User Management Curd!</h1>

        <br/>

        <div class="container">
            <input type="hidden" value="insert" id="user_type">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div id="div_button_user" class="col-offset-3 col-9">
                            <button onclick="showform()" class="btn btn-info text-white">Add New User</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6"></div>
            </div>

            <br/>

            <div id="div_add_user">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">

                            <div class="card-body">
                                <form onsubmit="return false" id="form_insert_user" name="form_insert" role="form" method="POST"
                                      class="form-horizontal">
                                    <div class="form-body">
                                        <h3 class="box-title" style="color: white;">User Details</h3>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row mb-3">
                                                    <label
                                                        class="control-label text-right col-md-2">First Name</label>
                                                    <div class="col-md-10">
                                                        <input type="text" id="fname" name="fname"
                                                               class="form-control" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row mb-3">
                                                    <label
                                                        class="control-label text-right col-md-2">Last Name</label>
                                                    <div class="col-md-10">
                                                        <input type="text" id="lname" name="lname"
                                                               class="form-control" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row mb-3">
                                                    <label
                                                        class="control-label text-right col-md-2">NIC No</label>
                                                    <div class="col-md-10">
                                                        <input type="text" id="nic" name="nic"
                                                               class="form-control" required>
                                                    </div>
                                                </div>
                                                <div class="form-group row mb-3">
                                                    <label
                                                        class="control-label text-right col-md-2">Mobile</label>
                                                    <div class="col-md-10">
                                                        <input type="tel" id="mobile" name="mobile"
                                                               class="form-control" required>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <input type="hidden" id="id" name="id" value="0">
                                                        <button onclick="save()" class="btn btn-success">Save
                                                        </button>
                                                        <button type="reset" class="btn btn-inverse">Clear</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"></div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br/>
            <br/>

            <div class="row">
                <div class="col-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>NIC No</th>
                                <th>Mobile</th>
                                <th>Created Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">

                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <script>


            function inti() {

                var x = document.getElementById("div_add_user");
                x.style.display = "none";

                loadUsers();
            }

            function showform() {
                var x = document.getElementById("div_add_user");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }

                document.getElementById("fname").value = "";
                document.getElementById("lname").value = "";
                document.getElementById("nic").value = "";
                document.getElementById("mobile").value = "";
                document.getElementById("user_type").value = "insert";

            }

            function save() {

                let fname = document.getElementById("fname").value;
                let lname = document.getElementById("lname").value;
                let nic = document.getElementById("nic").value;
                let mobile = document.getElementById("mobile").value;
                let id = document.getElementById("id").value;

                if (fname == null) {
                    alert("First Name is Empty!");
                } else if (lname == null) {
                    alert("Last Name is Empty!");
                } else if (nic == null) {
                    alert("NIC Name is Empty!");
                } else if (mobile == null) {
                    alert("Mobile Name is Empty!");
                } else {

                    if (document.getElementById("user_type").value == "insert") {

                        xmlShop = new XMLHttpRequest();
                        xmlShop.onreadystatechange = function () {
                            if ((xmlShop.readyState == 4) && (xmlShop.status == 200)) {
                                var resptext = this.responseText;
                                console.log("Data >> " + resptext);
                                var dataArray = JSON.parse(resptext);
                                console.log(dataArray.status);

                                alert(dataArray.message);

                                if (dataArray.status == 200) {
                                    document.getElementById("fname").value = "";
                                    document.getElementById("lname").value = "";
                                    document.getElementById("nic").value = "";
                                    document.getElementById("mobile").value = "";

                                    loadUsers();
                                }

                            }
                        };
                        xmlShop.open("POST", "saveUser", true);
                        xmlShop.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xmlShop.send("fname=" + fname + "&lname=" + lname + " &nic=" + nic + " &mobile=" + mobile);

                    } else {

                        xmlShop = new XMLHttpRequest();
                        xmlShop.onreadystatechange = function () {
                            if ((xmlShop.readyState == 4) && (xmlShop.status == 200)) {
                                var resptext = this.responseText;
                                console.log("Data >> " + resptext);
                                var dataArray = JSON.parse(resptext);
                                console.log(dataArray.status);

                                alert(dataArray.message);

                                if (dataArray.status == 200) {
                                    document.getElementById("fname").value = "";
                                    document.getElementById("lname").value = "";
                                    document.getElementById("nic").value = "";
                                    document.getElementById("mobile").value = "";
                                    document.getElementById("id").value = "";

                                    loadUsers();
                                }

                            }
                        };
                        xmlShop.open("POST", "updateUser", true);
                        xmlShop.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xmlShop.send("fname=" + fname + "&lname=" + lname + " &nic=" + nic + " &mobile=" + mobile + "&id=" + id);

                    }
                }
            }


            function loadUsers() {
                xmlShop = new XMLHttpRequest();
                xmlShop.onreadystatechange = function () {
                    if ((xmlShop.readyState == 4) && (xmlShop.status == 200)) {
                        var resptext = this.responseText;
                        console.log("Data >> " + resptext);
                        var dataArray = JSON.parse(resptext);
                        console.log(dataArray.status);

                        // alert(dataArray.message);

                        if (dataArray.status == 200) {

                            let value = '';

                            for (var item in dataArray.data) {
                                value += '<tr>'
                                value += '<td>' + dataArray.data[item].id + '</td>'
                                value += '<td>' + dataArray.data[item].fname + '</td>'
                                value += '<td>' + dataArray.data[item].lname + '</td>'
                                value += '<td>' + dataArray.data[item].nic + '</td>'
                                value += '<td>' + dataArray.data[item].mobile + '</td>'
                                value += '<td>';
                                value += '<button class="btn btn-sm btn-success mr-1" onclick="editUsers(' + dataArray.data[item].id + ')">Edit</button>';
                                value += '<button class="btn btn-sm btn-danger mr-1" onclick="deleteUsers(' + dataArray.data[item].id + ')">Delete</button>';
//                                value += ' <button class="btn  btn-sm btn-danger onclick="deleteUsers(' + dataArray.data[item].id + ')">Delete</button>';
                                value += '</td>';
                                value += '</tr>'
                            }

                            document.getElementById("tbody").innerHTML = value;
                        }

                    }
                };
                xmlShop.open("GET", "getAllUsers", true);
                xmlShop.send();
            }


            function editUsers(id) {
                document.getElementById("user_type").value = "update";

                xmlShop = new XMLHttpRequest();
                xmlShop.onreadystatechange = function () {
                    if ((xmlShop.readyState == 4) && (xmlShop.status == 200)) {
                        var resptext = this.responseText;
                        console.log("Data >> " + resptext);
                        var dataArray = JSON.parse(resptext);
                        console.log(dataArray.status);

                        // alert(dataArray.message);

                        if (dataArray.status == 200) {

                            document.getElementById("id").value = dataArray.data.id;
                            document.getElementById("fname").value = dataArray.data.fname;
                            document.getElementById("lname").value = dataArray.data.fname;
                            document.getElementById("nic").value = dataArray.data.fname;
                            document.getElementById("mobile").value = dataArray.data.fname;

                            var x = document.getElementById("div_add_user");
                            x.style.display = "block";

                        }

                    }
                };
                xmlShop.open("GET", "getUserById?id=" + id, true);
                xmlShop.send();
            }

            function deleteUsers(id) {

                xmlShop = new XMLHttpRequest();
                xmlShop.onreadystatechange = function () {
                    if ((xmlShop.readyState == 4) && (xmlShop.status == 200)) {
                        var resptext = this.responseText;
                        console.log("Data >> " + resptext);
                        var dataArray = JSON.parse(resptext);
                        console.log(dataArray.status);

                        alert(dataArray.message);
                        loadUsers();

                    }
                };
                xmlShop.open("GET", "deleteUser?id=" + id, true);
                xmlShop.send();
            }



        </script>


        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
        -->
    </body>
</html>

