page 50006 OrdersList
{
    ApplicationArea = All;
    Caption = 'OrdersList';
    PageType = List;
    SourceTable = Orders;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No"; Rec."No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer field.';
                }
                field(Product; Rec.Product)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product field.';
                }
                field("Order Notes"; Rec."Order Notes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Notes field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field("Order Week"; Rec."Order Week")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Week field.';
                }
                field("Order Day"; Rec."Order Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Day field.';
                }
                field("Shipping Method"; Rec."Shipping Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipping Method field.';
                }

                field("Order Status"; Rec."Order Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Status field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Open Order card")
            {
                RunObject = page "OrdersCard";
                RunPageLink = "No" = FIELD("No");
                Promoted = false;
                Image = Card;
            }

            action("Setup Order No")
            {
                Image = Setup;

                trigger OnAction()
                var
                    OrderSetup: Codeunit 50005;
                begin
                    OrderSetup.NumOrdersSetup();
                end;
            }
        }
    }
}
