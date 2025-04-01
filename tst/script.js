document.getElementById('compare-button').addEventListener('click', function() {
    const checkedItems = document.querySelectorAll('#item-list input[type="checkbox"]:checked');
    const comparisonContainer = document.getElementById('comparison-columns');
    
    // Clear previous comparison results
    comparisonContainer.innerHTML = '';

    // Create a column for each selected item
    checkedItems.forEach(item => {
        const column = document.createElement('div');
        column.classList.add('column');
        column.innerHTML = `<h3>${item.value}</h3><p>Details about ${item.value}</p>`;
        comparisonContainer.appendChild(column);
    });

    // Check if no items were selected
    if (checkedItems.length === 0) {
        comparisonContainer.innerHTML = '<p>Please select items to compare.</p>';
    }
});