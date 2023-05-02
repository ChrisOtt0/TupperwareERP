page 50007 OrdersCard
{
    Caption = 'OrdersCard';
    PageType = Card;
    SourceTable = Orders;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No field.';
                    Editable = false;
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
                field("Order Status"; Rec."Order Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Status field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Shipping Method"; Rec."Shipping Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipping Method field.';
                }
            }
        }
    }
}
