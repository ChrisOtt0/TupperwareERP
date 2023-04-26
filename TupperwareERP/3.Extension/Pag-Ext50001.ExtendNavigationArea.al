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
            }
        }
    }
}
