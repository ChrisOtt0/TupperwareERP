page 50003 ProductCard
{
    Caption = 'ProductCard';
    PageType = Card;
    SourceTable = Product;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Product Category"; Rec."Product Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Category field.';
                }
                field("Inventory Quantity"; Rec."Inventory Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory Quantity field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field("Woo Id"; Rec."Woo Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Woo ID field.';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            // Actions goes here
            action("Export to WooCommerce")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    unit: Codeunit WooCommerce;
                    WooId: Integer;
                begin
                    WooId := unit.ExportProduct(Rec.Name, Rec.Price, Rec.Description, Rec."Inventory Quantity");
                    Rec."Woo Id" := WooId;
                end;
            }
        }
    }

    // Set the week number 
    trigger OnAfterGetRecord()
    begin
        Rec."Current Week" := Date2DWY(Today, 2);
    end;
}
