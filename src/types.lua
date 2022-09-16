



export type expect = {
    is: is,
    isnt: is,

    equal: nil,
    unequal: nil,

    has: nil,
    hasnt: nil,
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
}


return {}