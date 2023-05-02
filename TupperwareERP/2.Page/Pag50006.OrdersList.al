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
                field("Order No"; Rec."Order No")
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
}
