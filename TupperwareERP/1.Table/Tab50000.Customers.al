// table 50000 Customers
// {
//     Caption = 'Customers';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; No; Code[20])
//         {
//             Caption = 'No';
//             DataClassification = ToBeClassified;
//         }
//         field(2; Name; Text[50])
//         {
//             Caption = 'Name';
//             DataClassification = ToBeClassified;
//         }
//         field(3; "Surname"; Text[50])
//         {
//             Caption = 'Last Name';
//             DataClassification = ToBeClassified;
//         }
//         field(4; Mail; Text[100])
//         {
//             Caption = 'Mail';
//             DataClassification = ToBeClassified;
//         }
//         field(5; Phone; Text[20])
//         {
//             Caption = 'Phone';
//             DataClassification = ToBeClassified;
//         }
//         field(100; "No. Series"; Code[20])
//         {
//             Caption = 'No. Series';
//             Editable = false;
//             TableRelation = "No. Series";
//         }
//     }
//     keys
//     {
//         key(PK; No)
//         {
//             Clustered = true;
//         }
//     }

//     trigger OnInsert()
//     var
//         CustomerSetup: Record "CustomerSetup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         EmailUnit: Codeunit EmailUnit;
//     begin
//         if "No" = '' then begin
//             CustomerSetup.get;
//             CustomerSetup.TestField("Customer Nos");
//             NoSeriesMgt.InitSeries(CustomerSetup."Customer Nos", xRec."No. Series", 0D, "No", "No. Series");
//         end;

//         EmailUnit.SendWelcome(Rec.Mail);
//     end;

// }

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
        field(3; "Surname"; Text[50])
        {
            Caption = 'Surname';
            DataClassification = ToBeClassified;
        }
        field(4; email; Text[100])
        {
            Caption = 'email';
            DataClassification = ToBeClassified;
        }
        field(5; Phone; Text[20])
        {
            Caption = 'Phone';
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
        CustomerSetup: Record "CustomerSetup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No" = '' then begin
            CustomerSetup.get;
            CustomerSetup.TestField("Customer Nos");
            NoSeriesMgt.InitSeries(CustomerSetup."Customer Nos", xRec."No. Series", 0D, "No", "No. Series");
        end;
    end;

}
