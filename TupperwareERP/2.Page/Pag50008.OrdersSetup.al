page 50008 OrdersSetup
{
    Caption = 'OrdersSetup';
    PageType = Card;
    SourceTable = OrdersSetup;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Export Path"; Rec."Export Path")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export Path field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No field.';
                    Editable = false;
                }
            }
        }
    }
}
