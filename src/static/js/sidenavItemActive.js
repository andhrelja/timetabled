export { makeActive };


const SidenavItems = [
    'homeSidenav', 'subjectsSidenav', 'activitiesSidenavDropdown', 'accountsSidenav',
    'subjectsSidenavDropdown', 'activitiesSidenavDropdown', 'acccountsSidenavDropdown',
    'subjectsListSidenav', 'activitiesSidenavIspitne', 'activitiesSidenavNastavne',
    'departmentsSidenav'
]

function disableActive() {
    for(let sidenavItem of SidenavItems) {
        document.getElementById(sidenavItem).classList.remove('active');
    }
}

function makeActive(id, expandSubjects=false, expandActivities=false, subjectId=null, activityName=null) {
    disableActive();

    let subnavItem = document.getElementById(id);
    subnavItem.classList.add('active');

    if (expandSubjects && subjectId) {
        document.getElementById('subjectsSidenav').classList.remove('active');
        document.getElementById('subjectsSidenavDropdown').classList.add('show');
        document.getElementById('subject-' + subjectId).classList.add('active');
    }
    else if (expandSubjects && subjectId === null) {
        document.getElementById('subjectsSidenav').classList.remove('active');
        document.getElementById('subjectsSidenavDropdown').classList.add('show');
        document.getElementById('subjectsListSidenav').classList.add('active');
    }
    else {
        document.getElementById('subjectsSidenavDropdown').classList.remove('show');
    }

    if (expandActivities && activityName) {
        document.getElementById('activitiesSidenavDropdown').classList.remove('active');
        document.getElementById('activitiesSidenavDropdown').classList.add('show');
        
        if (activityName.startsWith('Ispitne'))
            document.getElementById('activitiesSidenavIspitne').classList.add('active');
        else if (activityName.startsWith('Nastavne'))
            document.getElementById('activitiesSidenavNastavne').classList.add('active');
    }
    else if (expandActivities && activityName === null) {
        document.getElementById('activitiesSidenavDropdown').classList.add('show');
    }
    else {
        document.getElementById('activitiesSidenavDropdown').classList.remove('show');
    }  
}