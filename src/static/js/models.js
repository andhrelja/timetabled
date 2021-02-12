export { UNIVERSITY, DEPARTMENT, PROGRAM }

const UNIVERSITY = {
    'id': Number(),
    'name': String(),
    'code': String(),
    'address': String(),
    'email': String(),
    'contact': String()
}

const DEPARTMENT = {
    'id': Number(),
    'name': String(),
    'code': String(),
    'address': String(),
    'email': String(),
    'contact': String(),
    'web': String(),
    'university': String()
}

const PROGRAM = {
    'id': Number(),
    'name': String(),
    'type': String(),
    'department': String()
}
