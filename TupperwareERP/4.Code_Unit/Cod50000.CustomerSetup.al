codeunit 50000 CustomerSetup
{
    TableNo = Customers;

    trigger OnRun()
    begin
        InitSetup();
    end;

    // REMEMBER TO CALL THIS BEFORE NUMCONSULTANTSETUP 
    procedure InitSetup()
    var
        CustomerSetup: Record "CustomerSetup";
    begin

        Message('CALLED');
        SetupExists := CustomerSetup.get();
        if SetupExists then
            exit;

        CustomerSetup.Init;
        CustomerSetup."Export Path" := 'C:\RUN\MY\';

        if CustomerSetup.Insert then
            Message('Consultant setup done')
        else
            Message('Doesnt work');

    end;

    procedure NumCustomerSetup()

    var
        CustomerSetup: Record "CustomerSetup";
        NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";

    begin
        //no series creation
        InitSetup(); // THIS IS IMPORTANT
        CustomerSetup.init;
        NoSerie.Code := 'STD';
        NoSerie.Description := 'Customer Management';
        NoSerie."Default Nos." := true;
        NoSerie."Manual Nos." := true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'STD0000';
        NoSerieLine."Ending No." := 'STD9000';
        if NoSerieLine.Insert then;
        CustomerSetup."Customer Nos" := NoSerie.code;
        CustomerSetup.Modify();

    end;

    var
        SetupExists: Boolean;
}


