codeunit 50002 CustomerManagement
{
    TableNo = Customers;

    trigger OnRun()
    begin

    end;

    procedure InsertCustomer(Name: Text[50]; LastName: Text[50]; Mail: Text[50]; Phone: Text[50]): Boolean
    var
        Customers: Record "Customers";
    begin
        Customers.Name := Name;
        Customers."Last Name" := LastName;
        Customers.Mail := Mail;
        Customers.Phone := Phone;

        if Customers.Insert then begin
            Message('Customer inserted');
            exit(true);
        end
        else begin
            Message('Customer not inserted');
            exit(false);
        end
    end;

}