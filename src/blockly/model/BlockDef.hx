package blockly.model;

/**
 * Definition models for blocks
 */

typedef BlockDef = {
    connections: Null<ConnectionTypes>,
    inlining: Inlining,
    colour: BlockColour,
    tooltip: String,
    warning: Null<String>,
    help: String,
    inputs: Array<InputDef>
}

typedef ConnectionTypes = {
    topType: Null<ValueType>,    // null = no top connection
    bottomType: Null<ValueType>, // null = no bottom connection
    outType: Null<ValueType>     // null = no output connection
}

enum BlockColour {
    HSVColour(value: Int);
    RGBColour(value: String);
}

enum Inlining { Automatic; External; Internal; }

enum InputDef {
    Dummy(name: String, alignment: FieldAlignment, fields: Array<FieldDef>);
    LabelledField(label: String, alignment: FieldAlignment, field: FieldDef);
    Value(name: String, type: ValueType, alignment: FieldAlignment, fields: Array<FieldDef>);
    Statement(name: String, type: ValueType, alignment: FieldAlignment, fields: Array<FieldDef>);
}

enum FieldDef {
    TextLabel(text: String, cssClass: String);
    TextInput(name: String, text: String);
    Angle(name: String, value: Int);
    DropDown(name: String, value: String, options: Array<{value: String, text: String}>);
    Colour(name: String, value: String);
    CustomColours(name: String, value: String, cols: Int, colours: Array<String>);
    CheckBox(name: String, value: Bool);
    Variable(name: String, value: String);
    Image(url: String, w: Int, h: Int, alt: String);
    Numeric(name: String, value: String, min: Dynamic, max: Dynamic, precision: Dynamic );
    DateSelect(name: String, value: String);
}

enum ValueType {
    AnyType; BoolType; NumType; StringType; ListType;
    UnionType(types: Array<ValueType>);
    CustomType(name: String);
}

enum FieldAlignment { Left; Right; Center; }
