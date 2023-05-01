codeunit 50003 ProductManagement
{
    TableNo = Product;

    trigger OnRun()
    begin

    end;


    procedure InsertProduct(Name: Text[50]; Description: Text[100]; Price: Decimal; Cost: Decimal; InventoryQuantity: Integer; ProductCategory: Option): Boolean
    var
        Product: Record Product;
    begin
        Product.Name := Name;
        Product.Description := Description;
        Product.Price := Price;
        Product.Cost := Cost;
        Product."Inventory Quantity" := InventoryQuantity;
        Product."Product Category" := ProductCategory;


        if Product.Insert then begin
            Message('Product inserted');
            exit(true);
        end
        else begin
            Message('Product not inserted');
            exit(false);
        end;
    end;

    procedure GetProductNames(ProductNameList: Text[50])
    var
        ProductTable: Record Product;
    begin
        ProductNameList := '';
        if not ProductTable.FindSet then
            exit;

        repeat
            if ProductNameList <> '' then
                ProductNameList := ProductNameList + ',';
            ProductNameList := ProductNameList + '"' + ProductTable.Name + '"';
        until ProductTable.Next = 0;

        ProductNameList := '[' + ProductNameList + ']';

    end;

    procedure GetProductOptions(): Text[100]
    var
        Product: Text[100];
        i: Integer;
    begin
        Product := '';
        for i := 1 to 10 do begin
            Product := Product + 'Product' + FORMAT(i) + ';';
        end;
        exit(Product);
    end;
}


