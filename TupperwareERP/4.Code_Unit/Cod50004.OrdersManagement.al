codeunit 50004 OrdersManagement
{
    TableNo = Orders;

    trigger OnRun()
    begin

    end;

    procedure InsertOrder(Customer: Text[50]; "Order Date": Date; "Order Status": Option; "Shipping Method": Option; "Order Notes": Text[100]; Product: Text[50]): Boolean
    var
        Orders: Record Orders;
    begin
        Orders."Customer" := Customer;
        Orders."Order Date" := "Order Date";
        Orders."Order Status" := "Order Status";
        Orders."Shipping Method" := "Shipping Method";
        Orders."Order Notes" := "Order Notes";
        Orders."Product" := Product;

        if Orders.Insert then begin
            Message('Order inserted');
            exit(true);
        end
        else begin
            Message('Order not inserted');
            exit(false);
        end;
    end;
}
