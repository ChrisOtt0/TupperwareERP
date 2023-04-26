page 50004 CustomerSetup
{
    ApplicationArea = All;
    Caption = 'CustomerSetup';
    PageType = Card;
    SourceTable = CustomerSetup;

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
            }
        }
    }
}
