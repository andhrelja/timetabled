import { UNIVERSITY, DEPARTMENT, PROGRAM } from './models.js';

const universitySelect = document.getElementById("id_university");
const departmentSelect = document.getElementById("id_department");
const programSelect    = document.getElementById("id_program");

const switcher = {
    'university': {
        'url': "/departments/api/filter/university/",
        'toggle': departmentSelect,
        'id': "id_university"
    },
    'program': {
        'url': "/departments/api/filter/program/",
        'toggle': programSelect,
        'id_program': "id_program",
        'id_type': "id_type",
        'id': "id_program"
    },
}

window.onload = main();

function main() {
    document.getElementById("id_university")
        .addEventListener("change", 
            () => fetchContextData(switcher.university, displayUniversityDepartments));
    
    document.getElementById("id_type")
        .addEventListener("change", 
            () => fetchContextData2(switcher.program, displayUniversityDepartments));
    
}

// Get selected
function getSelectedOption(selectId) {
    let select = document.getElementById(selectId);
    for (let option of select) {
        if (option.selected)
            return option;
    }
    return false;
}

function dataFieldsSearch(pk, array) {
    for (let item of array) {
        if (item.pk == pk)
            return true;
    }
    return false;
}

function fetchContextData(context, callback) {
    let selectedOption = getSelectedOption(context.id);
    fetch(context.url + selectedOption.value)
        .then((data) => data.json())
        .then((json_data) => callback(json_data, context.toggle));
}

function fetchContextData2(context, callback) {
    let selectedProgram = getSelectedOption(context.id_program);
    let selectedType = getSelectedOption(context.id_type);
    console.log(context.url, selectedProgram.value, selectedType.value);
    fetch(context.url + selectedProgram.value + "/" + selectedType.value)
        .then((data) => data.json())
        .then((json_data) => callback(json_data, context));
}

// Display selected
function displayUniversityDepartments(data, context) {
    let selectedOption = getSelectedOption(context.id);
    
    if (!dataFieldsSearch(selectedOption.value, data)) {
        deleteSelectOptions(context.toggle);
    }
}

function deleteSelectOptions(Select) {
    while (Select.firstChild) {
        Select.removeChild(Select.lastChild);
    }
}


// Get selected university
// Query university departments

// Get selected departments
// Display selected departments
// Query department programs

// Get selected programs
// Display selected programs

// Query program type
// Get selected program type
// Display selected program type