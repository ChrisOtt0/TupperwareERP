page 50002 ProductList
{
    ApplicationArea = All;
    Caption = 'ProductList';
    PageType = List;
    SourceTable = Product;
    UsageCategory = Lists;
    CardPageId = ProductCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
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
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open Product card")
            {
                RunObject = page "ProductCard";
                RunPageLink = "No" = FIELD("No");
                Promoted = false;
                Image = Card;
            }

            action("Setup Product No")
            {
                Image = Setup;

                trigger OnAction()
                var
                    ProductSetup: Codeunit 50001;
                begin
                    ProductSetup.NumProductSetup();
                end;
            }
        }
    }
}
