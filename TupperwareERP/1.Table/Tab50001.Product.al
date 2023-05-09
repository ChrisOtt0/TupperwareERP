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
        field(8; "Current Week"; Integer)
        {
            Caption = 'Current Week, might be a hack';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            begin
                "Current Week" := Date2DWY(today, 2);
            end;
        }
        field(9; "Mon sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(1))); // We're using a fixed week as we can't have dates after february
        }
        field(10; "Tue sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(2))); // We're using a fixed week as we can't have dates after february
        }
        field(11; "Wed sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(3))); // We're using a fixed week as we can't have dates after february
        }
        field(12; "Thu sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(4))); // We're using a fixed week as we can't have dates after february
        }
        field(13; "Fri sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(5))); // We're using a fixed week as we can't have dates after february
        }
        field(14; "Sat sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(6))); // We're using a fixed week as we can't have dates after february
        }
        field(15; "Sun sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6), "Order Day" = const(7))); // We're using a fixed week as we can't have dates after february
        }
        field(16; "Week sales"; Integer)
        {
            Caption = 'Times Sold';
            FieldClass = FlowField;
            CalcFormula = count(Orders where("Product" = field(No), "Order Week" = const(6))); // We're using a fixed week as we can't have dates after february
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
        ProductSetup: Record "ProductSetup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No" = '' then begin
            ProductSetup.get;
            ProductSetup.TestField("Product Nos");
            NoSeriesMgt.InitSeries(ProductSetup."Product Nos", xRec."No. Series", 0D, "No", "No. Series");
        end;
    end;
}
