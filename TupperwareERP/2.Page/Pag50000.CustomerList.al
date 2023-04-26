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
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Mail; Rec.Mail)
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
}
