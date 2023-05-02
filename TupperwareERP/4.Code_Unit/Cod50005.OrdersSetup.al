codeunit 50005 OrdersSetup
{
    TableNo = Orders;

    trigger OnRun()
    begin

    end;

    procedure InitSetup()
    var
        OrdersSetup: Record OrdersSetup;
    begin

        Message('CALLED');
        SetupExists := OrdersSetup.Get();
        if SetupExists then
            exit;

        OrdersSetup.Init;
        OrdersSetup."Export Path" := 'C:\RUN\MY';

        if OrdersSetup.Insert then
            Message('Orders Setup Done')
        else
            Message('Orders Setup Failed');

    end;

    procedure NumOrdersSetup()
    var
        OrdersSetup: Record OrdersSetup;
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";

    begin
        // no series creation
        InitSetup();
        OrdersSetup.init;
        NoSerie.Code := 'ORDERS';
        NoSerie.Description := 'Orders Management';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;

        if NoSerie.Insert then;
        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'ODS0000';
        NoSerieLine."Ending No." := 'ODS9000';

        if NoSerieLine.Insert then;
        OrdersSetup."Order Nos" := NoSerie.Code;
        OrdersSetup.Modify();

    end;

    var
        SetupExists: Boolean;




}
