<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="P9_PlacementDashboard.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Placement Dashboard</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            margin: 30px;
        }

        h1 {
            color: #243b55;
        }

        table {
            background: white;
            border-collapse: collapse;
        }

        td, th {
            padding: 12px;
            border: 1px solid #ddd;
        }

        .summary {
            margin-bottom: 25px;
        }

        .card {
            display: inline-block;
            background: white;
            padding: 15px;
            margin: 8px;
            border-radius: 8px;
            min-width: 130px;
        }

        .placed {
            color: green;
            font-weight: bold;
        }

        .unplaced {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <h1>Placement Dashboard</h1>

    <hr />

    <h3>Placement Summary</h3>

    <div class="summary">

        <div class="card">
            Total Students<br />
            <asp:Label ID="lblTotal" runat="server" />
        </div>

        <div class="card">
            Placed Students<br />
            <asp:Label ID="lblPlaced" runat="server" />
        </div>

        <div class="card">
            Unplaced Students<br />
            <asp:Label ID="lblUnplaced" runat="server" />
        </div>

        <div class="card">
            Placement Percentage<br />
            <asp:Label ID="lblPercentage" runat="server" />
        </div>

        <div class="card">
            Highest Package<br />
            <asp:Label ID="lblHighestPackage" runat="server" />
        </div>

        <div class="card">
            Average Package<br />
            <asp:Label ID="lblAveragePackage" runat="server" />
        </div>

    </div>

    <h3>Student Placement Records</h3>

    <asp:GridView ID="gvPlacements"
        runat="server"
        AutoGenerateColumns="False"
        EmptyDataText="No student records found."
        BorderWidth="1"
        CellPadding="8">

        <Columns>

            <asp:BoundField DataField="StudentId"
                HeaderText="Student ID" />

            <asp:BoundField DataField="CompanyName"
                HeaderText="Company" />

            <asp:BoundField DataField="JobRole"
                HeaderText="Job Role" />

            <asp:BoundField DataField="PackageLPA"
                HeaderText="Package (LPA)"
                DataFormatString="{0:N2}" />

            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>

                    <asp:Label runat="server"
                        Text='<%# Convert.ToBoolean(Eval("IsPlaced")) ? "Placed" : "Not Placed" %>'
                        CssClass='<%# Convert.ToBoolean(Eval("IsPlaced")) ? "placed" : "unplaced" %>' />

                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>

    <br />

    <asp:HyperLink ID="lnkCompanies"
        runat="server"
        NavigateUrl="~/Companies.aspx">

        View Company Summary

    </asp:HyperLink>

</form>

</body>
</html>