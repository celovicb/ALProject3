table 50100 "BC Country/Region Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Country/Region Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; CountryCode; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Country Code';
            TableRelation = "Country/Region";
            //           ObsoleteState = Pending;
            //          ObsoleteReason = 'In version 2.0 this field will be removed';

            trigger OnValidate()
            begin
                CalcFields("Country/Region Name");
            end;
        }
        field(3; "Country/Region Name"; Text[50])
        {
            Caption = 'Country/Region Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Country/Region".Name where(Code = field(CountryCode)));
            Editable = false;
        }
        field(4; "Country/Region Enum"; Enum "BC Country/RegionEnum")
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}