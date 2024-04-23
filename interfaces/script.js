
function toggleCollapse(elementId) {
    var collapseDiv = document.getElementById(elementId);

    if (!collapseDiv) {
        console.error('Element with ID ' + elementId + ' not found.');
        return;
    }

    // Get all elements with the 'show' class
    var elementsWithShowClass = document.querySelectorAll('.show');

    // Remove 'show' class from all elements except the target element
    elementsWithShowClass.forEach(function(element) {
        if (element !== collapseDiv) {
            element.classList.remove('show');
        }
    });

    // Check if the collapse element is currently shown
    var isShown = collapseDiv.classList.contains('show');

   
    if (isShown) {
       
        collapseDiv.classList.remove('show');
    } else {
       
        collapseDiv.classList.add('show');
    }
}


// Function to toggle angle state based on element ID
function changeAngle(elementId) {
    var angle = document.getElementById(elementId);

    // Check if the angle element is currently shown as 'down'
    var isDown = angle.classList.contains('fa-angle-down');

    // Toggle the angle state
    if (isDown) {
        // If currently 'down', change to 'right'
        angle.classList.remove('fa-angle-down');
        angle.classList.add('fa-angle-right');
    } else {
        // If currently 'right', change to 'down'
        angle.classList.remove('fa-angle-right');
        angle.classList.add('fa-angle-down');
    }
}

