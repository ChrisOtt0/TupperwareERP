codeunit 50004 OrdersManagement
{
    TableNo = Orders;

    trigger OnRun()
    begin

    end;

    procedure InsertOrder(Customer: Text[100]; OrderDate: Text; OrderStatus: Text; OrderNotes: Text[100]; Product: Integer): Boolean
    var
        Orders: Record Orders;
        Products: Record Product;
        ProductNo: Code[20];
        EmailUnit: Codeunit EmailUnit;
    begin
        Orders."Customer" := Customer;
        Evaluate(Orders."Order Date", OrderDate);
        Evaluate(Orders."Order Status", OrderStatus);
        Orders."Order Notes" := OrderNotes;

        Products.SetFilter(Products."Woo Id", '%1', Product);
        if Products.FindFirst() then
            Orders."Product" := Products.No;

        if Orders.Insert(true) then begin
            Message('Order inserted');
            EmailUnit.SendConfirmation(Customer, Orders.No);
            exit(true);
        end
        else begin
            Message('Order not inserted');
            exit(false);
        end;
    end;
}
