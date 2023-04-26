table 50000 Customers
{
    Caption = 'Customers';
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
        field(3; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            DataClassification = ToBeClassified;
        }
        field(4; Mail; Text[100])
        {
            Caption = 'Mail';
            DataClassification = ToBeClassified;
        }
        field(5; Phone; Text[20])
        {
            Caption = 'Phone';
            DataClassification = ToBeClassified;
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
