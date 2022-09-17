



export type expect = {
    is: is,
    isNot: is,

    has: has,
    hasNot: has,
}

export type is = {
    server: () -> boolean,
    client: () -> boolean,

    none: () -> boolean,
    string: () -> boolean,
    number: () -> boolean,
    boolean: () -> boolean,
    table: () -> boolean,
    func: () -> boolean,
    thread: () -> boolean,

    instance: () -> boolean,
    class: (classname: string) -> boolean,

    equal: (value: any) -> boolean,
}

export type has = {
    property: (propertyName: string) -> boolean,
    properties: (propertyNames: {string}) -> boolean,

    attribute: (attributeName: string) -> boolean,
    attributes: (attributesNames: {string}) -> boolean,

    key: (key: any) -> boolean,
    keys: (keys: {any}) -> boolean,

    value: (value: any) -> boolean,
    values: (values: {any}) -> boolean,
}


return {}