page 50000 CustomerList
{
    ApplicationArea = All;
    Caption = 'CustomerList';
    PageType = List;
    SourceTable = Customers;
    UsageCategory = Lists;
    CardPageId = CustomerCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Surname"; Rec.Surname)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Mail; Rec.email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Open Customer card")
            {
                RunObject = page "CustomerCard";
                RunPageLink = "No" = FIELD("No");
                Promoted = false;
                Image = Card;
            }

            action("Setup Customer No")
            {
                Image = Setup;

                trigger OnAction()
                var
                    CustomerSetup: Codeunit 50000;
                begin
                    CustomerSetup.NumCustomerSetup();
                end;
            }
        }
    }
}
