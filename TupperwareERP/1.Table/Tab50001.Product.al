table 50001 Product
{
    Caption = 'Product';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = ToBeClassified;
        }
        field(5; Cost; Decimal)
        {
            Caption = 'Cost';
            DataClassification = ToBeClassified;
        }
        field(6; "Inventory Quantity"; Integer)
        {
            Caption = 'Inventory Quantity';
            DataClassification = ToBeClassified;
        }
        field(7; "Product Category"; Option)
        {
            Caption = 'Product Category';
            DataClassification = ToBeClassified;
            OptionMembers = "Normal","Microwaveable","Freezable","Oven Safe","Dishwasher Safe";
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
