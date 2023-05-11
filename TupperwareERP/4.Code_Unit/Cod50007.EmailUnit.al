codeunit 50007 EmailUnit
{
    procedure SendWelcome(Receiver: Text)
    var
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(Receiver, 'Welcome to Tupperware!', 'Welcome to Tupperware dear Customer. We are glad to have you.');
        Email.Send(EmailMessage, Enum::"Email Scenario"::"No Reply");
    end;

    procedure SendConfirmation(Receiver: Text; OrderNo: Code[20])
    var
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(Receiver, 'Order Confirmation for Order ' + Format(OrderNo), 'Your order with No. ' + Format(OrderNo) + ' has been confirmed.');
        Email.Send(EmailMessage, Enum::"Email Scenario"::"No Reply");
    end;

    var
        Email: Codeunit Email;
}
