codeunit 50006 WooCommerce
{
    // Still needs testing
    procedure InsertCustomer(Customer: JsonObject): Boolean
    var
        CustomerMan: Codeunit CustomerManagement;
        Token: JsonToken;
        Name: Text[50];
        LastName: Text[50];
        Email: Text[100];
        Phone: Text[20];
    begin
        if not Customer.Contains('name') then exit(false);
        if not Customer.Contains('lastName') then exit(false);
        if not Customer.Contains('email') then exit(false);
        if not Customer.Contains('phone') then exit(false);

        Customer.Get('name', Token);
        Name := Token.AsValue().AsText();

        Customer.Get('lastName', Token);
        LastName := Token.AsValue().AsText();

        Customer.Get('email', Token);
        Email := Token.AsValue().AsText();

        Customer.Get('phone', Token);
        Phone := Token.AsValue().AsText();

        if CustomerMan.InsertCustomer(Name, LastName, Email, Phone) then
            exit(true)
        else
            exit(false);
    end;

    // Needs to have some stuff cleared up
    procedure InsertOrder(Object: JsonObject): Boolean
    var
        OrderMan: Codeunit OrdersManagement;
        Token: JsonToken;

    begin

    end;

    procedure ExportProduct(Name: Text[50]; Price: Decimal; Description: Text[100]; Stock: Integer) JsonBody: JsonObject
    var
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Body: Text;
        DataJson: JsonObject;
        Url: Text;
    begin
        Url := 'http://localhost:81/wordpress/wp-json/wc/v3/products';

        DataJson.Add('name', Name);
        DataJson.Add('regular_price', Price);
        DataJson.Add('description', Description);
        DataJson.Add('stock_quantity', Stock);
        DataJson.WriteTo(Body);

        CreateHttpRequest('POST', Url, Body, Request);

        if Client.Send(Request, Response) then begin
            JsonBody := GetBodyAsJsonObject(Response);
        end;
    end;

    procedure UpdateStock(Id: Integer; Stock: Integer) JsonBody: JsonObject
    var
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Body: Text;
        DataJson: JsonObject;
        Url: Text;
    begin
        Url := 'http://localhost:81/wordpress/wp-json/wc/v3/products/' + Format(Id);

        DataJson.Add('stock_quantity', Stock);
        DataJson.WriteTo(Body);

        CreateHttpRequest('PUT', Url, Body, Request);

        if Client.Send(Request, Response) then begin
            JsonBody := GetBodyAsJsonObject(Response);
        end;
    end;

    local procedure CreateHttpRequest(Method: Text; Url: Text; Body: Text; Request: HttpRequestMessage)
    var
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        Content.WriteFrom(Body);
        Content.GetHeaders(Headers);

        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Request.Content := Content;
        Request.SetRequestUri(Url);
        Request.Method := Method;
        Request.GetHeaders(Headers);
    end;

    local procedure SetAuth()
    begin
        if not (Client.DefaultRequestHeaders.Contains('User-Agent')) then
            Client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');

        if not (Client.DefaultRequestHeaders.Contains('Authorize')) then
            Client.DefaultRequestHeaders.Add('Authorization', CreateAuthString());
    end;

    local procedure CreateAuthString() AuthString: Text
    var
        TypeHelper: Codeunit "Base64 Convert";
    begin
        AuthString := StrSubstNo('%1:%2', Ck, Cs);
        AuthString := TypeHelper.ToBase64(AuthString);
        AuthString := StrSubstNo('Basic %1', AuthString);
    end;

    local procedure GetBodyAsJsonObject(Response: HttpResponseMessage) JsonBody: JsonObject
    var
        Body: Text;
    begin
        Response.Content.ReadAs(Body);
        JsonBody.ReadFrom(Body);
    end;

    var
        Client: HttpClient;
        Ck: Label 'ck_b7e5d613bbc0177f5ae40bbe79e536d0a965dc78';
        Cs: Label 'cs_517e7163762fd8063ecc8efaedda6b0c84ddbba8';
}
