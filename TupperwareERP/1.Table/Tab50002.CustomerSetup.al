table 50002 CustomerSetup
{
    Caption = 'CustomerSetup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = AccountData;
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
        field(4; "Customer Nos"; Code[20])
        {
            Caption = 'Customer Nos';
            TableRelation = "No. Series";
            DataClassification = AccountData;
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
