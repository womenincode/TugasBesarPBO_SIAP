
<%@ include file="template/header.jsp"%>
<!--start page wrapper -->
<div class="page-wrapper">
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">Tables</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Data Table</li>
                    </ol>
                </nav>
            </div>
            <div class="ms-auto">
                <div class="btn-group">
                    <a href="create.jsp" class="btn btn-primary">Add User</a>
                </div>
            </div>
        </div>
        <!--end breadcrumb-->
        <h6 class="mb-0 text-uppercase">DataTable Example</h6>
        <hr />
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try{
                                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                statement=connection.createStatement();
                                String sql ="SELECT * FROM user";

                                resultSet = statement.executeQuery(sql);
                                while(resultSet.next()){
                        %>
                        <tr>
                            <td><%=resultSet.getString("name") %></td>
                            <td><%=resultSet.getString("address") %></td>
                            <td><%=resultSet.getString("email") %></td>
                            <td><%=resultSet.getString("password") %></td>
                            <td>
                                <a href="delete.jsp?id=<%=resultSet.getString("user_id") %>"><button type="button" class="delete">Hapus</button></a>
                                <a href="update-1.jsp?id=<%=resultSet.getString("user_id")%>"><button type="button" class="delete">Ubah</button></a>
                            </td>
                        </tr>
                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Password</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end page wrapper -->
<%@ include file="template/footer.jsp"%>