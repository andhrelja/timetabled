import { UNIVERSITY, DEPARTMENT, PROGRAM } from './models.js';

const universitySelect = document.getElementById("id_university");
const departmentSelect = document.getElementById("id_department");
const programSelect    = document.getElementById("id_program");

const switcher = {
    'university': {
        'url': "/departments/api/filter/university/",
        'id': "id_university"
    },
    'department': {
        'url': "/departments/api/filter/program/",
        'id': "id_department",
    },
    'program': () => console.log(data)
}

window.onload = main();

function main() {
    let departmentOption = getSelectedOption("id_department");
    let programOption    = getSelectedOption("id_program");

    document.getElementById("id_university").addEventListener("change", () => fetchUniversitiesData(switcher.university, displayUniversityDepartments))
    document.getElementById("id_department").addEventListener("change", () => fetchUniversitiesData(switcher.department, displayUniversityDepartments))
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

function dataFieldsSearch(pk, departments) {
    for (let department of departments) {
        if (department.pk == pk)
            return true;
    }
    return false;
}

function fetchUniversitiesData(switcher, callback) {
    let universityOption = getSelectedOption(switcher.id);
    fetch(switcher.url + universityOption.value)
        .then((universities_data) => universities_data.json())
        .then((json_data) => callback(json_data, departmentSelect));
}

// Display selected
function displayUniversityDepartments(departmentData, Select) {
    let departmentOption = getSelectedOption("id_department");
    // console.log(departmentData);
    if (!dataFieldsSearch(departmentOption.value, departmentData)) {
        deleteSelectOptions(Select);
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