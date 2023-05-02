table 50004 Orders
{
    Caption = 'Orders';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No"; Code[50])
        {
            Caption = 'Order No';
            DataClassification = ToBeClassified;
        }
        field(2; Customer; Text[50])
        {
            Caption = 'Customer';
            DataClassification = ToBeClassified;
        }
        field(3; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Order Status"; Option)
        {
            Caption = 'Order Status';
            DataClassification = ToBeClassified;
            OptionMembers = "Pending","Shipped","Invoiced","Cancelled";
        }
        field(5; "Payment Method"; Option)
        {
            Caption = 'Payment Method';
            DataClassification = ToBeClassified;
            OptionMembers = "Mobile Pay";
        }
        field(6; "Shipping Method"; Option)
        {
            Caption = 'Shipping Method';
            DataClassification = ToBeClassified;
            OptionMembers = "PostNord","GLS","DAO","Bring";
        }
        field(7; "Order Notes"; Text[100])
        {
            Caption = 'Order Notes';
            DataClassification = ToBeClassified;
        }
        field(8; Product; Text[50])
        {
            Caption = 'Product';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Order No")
        {
            Clustered = true;
        }
    }
}
