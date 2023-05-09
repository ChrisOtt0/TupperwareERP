pageextension 50001 ExtendNavigationArea extends "Order Processor Role Center"
{

    actions
    {
        addlast(sections)
        {
            group("Tupperware")
            {
                action("Customer List")
                {
                    RunObject = Page "CustomerList";
                    ApplicationArea = All;
                }
                action("Product List")
                {
                    RunObject = Page "ProductList";
                    ApplicationArea = All;
                }
                action("Orders List")
                {
                    RunObject = Page "OrdersList";
                    ApplicationArea = All;
                }
                action("Product Chart")
                {
                    RunObject = Page "Chart";
                    ApplicationArea = All;
                }
                action("Customer Setup")
                {
                    RunObject = Page "CustomerSetup";
                    ApplicationArea = All;
                }
                action("Product Setup")
                {
                    RunObject = Page "ProductSetup";
                    ApplicationArea = All;
                }
                action("Order Setup")
                {
                    RunObject = Page "OrdersSetup";
                    ApplicationArea = All;
                }
            }
        }
    }
}
