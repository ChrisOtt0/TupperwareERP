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
            }
        }
    }
}
