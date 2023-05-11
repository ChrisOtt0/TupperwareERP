table 50004 Orders
{
    Caption = 'Orders';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[50])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(2; Customer; Text[100])
        {
            Caption = 'Customer';
            TableRelation = Customers.email;
        }
        field(3; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Order Week"; Integer)
        {
            Caption = 'Order Week';
        }
        field(5; "Order Day"; Integer)
        {
            Caption = 'Order Day';
        }
        field(6; "Order Status"; Option)
        {
            Caption = 'Order Status';
            DataClassification = ToBeClassified;
            OptionMembers = "Pending","Shipped","Invoiced","Cancelled","Processing";
        }
        field(8; "Order Notes"; Text[100])
        {
            Caption = 'Order Notes';
            DataClassification = ToBeClassified;
        }
        field(9; Product; Code[20])
        {
            Caption = 'Product';
            TableRelation = Product.No;
            DataClassification = ToBeClassified;
        }
        field(100; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        OrdersSetup: Record "OrdersSetup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmailUnit: Codeunit EmailUnit;
    begin
        if "No" = '' then begin
            OrdersSetup.get;
            OrdersSetup.TestField("Order Nos");
            NoSeriesMgt.InitSeries(OrdersSetup."Order Nos", xRec."No. Series", 0D, "No", "No. Series");
        end;

        EmailUnit.SendConfirmation(Rec.Customer, Rec.No);
    end;

    trigger OnModify()
    var
        OrdersRec: Record "Orders";
    begin
        Rec."Order Week" := Date2DWY("Order Date", 2);
        Rec."Order Day" := Date2DWY("Order Date", 1);

        Commit();

        Rec.MODIFY();
    end;
}
