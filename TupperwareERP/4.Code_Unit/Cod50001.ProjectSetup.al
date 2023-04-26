codeunit 50001 ProjectSetup
{
    TableNo = Product;

    trigger OnRun()
    begin
        InitSetup();
    end;

    // REMEMBER TO CALL THIS BEFORE NUMCONSULTANTSETUP 
    procedure InitSetup()
    var
        ProductSetup: Record "ProductSetup";
    begin

        Message('CALLED');
        SetupExists := ProductSetup.get();
        if SetupExists then
            exit;

        ProductSetup.Init;
        ProductSetup."Export Path" := 'C:\RUN\MY\';

        if ProductSetup.Insert then
            Message('Product setup done')
        else
            Message('Doesnt work');

    end;

    procedure NumProductSetup()

    var
        ProductSetup: Record "ProductSetup";
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";

    begin
        //no series creation
        InitSetup(); // THIS IS IMPORTANT
        ProductSetup.init;
        NoSerie.Code := 'PDT';
        NoSerie.Description := 'Product Management';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'PDT0000';
        NoSerieLine."Ending No." := 'PDT9000';
        if NoSerieLine.Insert then;
        ProductSetup."Product Nos" := NoSerie.code;
        ProductSetup.Modify();

    end;

    var
        SetupExists: Boolean;
}

