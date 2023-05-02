table 50005 OrdersSetup
{
    Caption = 'OrdersSetup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Export Path"; Text[200])
        {
            Caption = 'Export Path';
            DataClassification = ToBeClassified;
        }
        field(3; "File Name"; Text[200])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Order No"; Code[20])
        {
            Caption = 'Order No';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
