codeunit 50006 WooCommerce
{
    procedure UpdateStockQuantity(WooId: Integer; Stock: Integer): Boolean
    var
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        DataJson: JsonObject;
        Token: JsonToken;
        Body: Text;
        Url: Text;
    begin
        SetAuth();
        Url := 'https://localhost:81/wordpress/wp-json/wc/v3/products/' + Format(WooId);

        DataJson.Add('stock_quantity', Stock);
        DataJson.WriteTo(Body);

        CreateHttpRequest('PUT', Url, Body, Request);

        if Client.Send(Request, Response) then
            exit(true)
        else
            exit(false);
    end;

    procedure ExportProduct(Name: Text[50]; Price: Decimal; Description: Text[100]; Stock: Integer) WooId: Integer
    var
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        ResponseJson: JsonObject;
        Token: JsonToken;
        Body: Text;
        DataJson: JsonObject;
        Url: Text;
    begin
        SetAuth();
        Url := 'http://192.168.1.254:81/wordpress/wp-json/wc/v3/products';

        DataJson.Add('name', Name);
        DataJson.Add('regular_price', Format(Price));
        DataJson.Add('description', Description);
        DataJson.Add('stock_quantity', Stock);
        DataJson.WriteTo(Body);

        CreateHttpRequest('POST', Url, Body, Request);

        if Client.Send(Request, Response) then begin
            Message('Success Sending');
            ResponseJson := GetBodyAsJsonObject(Response);
        end;

        Message(Format(ResponseJson));

        if not ResponseJson.Contains('id') then exit(0);
        ResponseJson.Get('id', Token);
        WooId := Token.AsValue().AsInteger();
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
        if not (Client.DefaultRequestHeaders.Contains('User-Agent')) then begin
            Client.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        end;

        if not (Client.DefaultRequestHeaders.Contains('Authorize')) then begin
            Client.DefaultRequestHeaders.Add('Authorization', CreateAuthString());
        end;
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

        // Comment or uncomment as needed.
        Ck: Label 'ck_b7e5d613bbc0177f5ae40bbe79e536d0a965dc78';
        Cs: Label 'cs_517e7163762fd8063ecc8efaedda6b0c84ddbba8';
}
