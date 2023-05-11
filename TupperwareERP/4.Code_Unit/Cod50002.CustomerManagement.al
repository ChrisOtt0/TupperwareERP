codeunit 50002 CustomerManagement
{
    TableNo = Customers;

    trigger OnRun()
    begin

    end;

    procedure InsertCustomer(Name: Text[50]; Surname: Text[50]; email: Text[50]; Phone: Text[50]): Boolean
    var
        Customers: Record "Customers";
        EmailUnit: Codeunit EmailUnit;
    begin
        Customers.No := ''; // how no series work
        Customers.Name := Name;
        Customers."Surname" := Surname;
        Customers.email := email;
        Customers.Phone := Phone;

        if Customers.Insert then begin
            Message('Customer inserted');
            EmailUnit.SendWelcome(Email);
            exit(true);
        end
        else begin
            Message('Customer not inserted');
            exit(false);
        end
    end;
}
