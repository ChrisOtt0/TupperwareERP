page 50001 CustomerCard
{
    Caption = 'CustomerCard';
    PageType = Card;
    SourceTable = Customers;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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

    actions
    {
        area(processing)
        {
            // Actions goes here
        }
    }
}
